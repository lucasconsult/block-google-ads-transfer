# If necessary, uncomment the line below to include explore_source.
# include: "block_google_ads_transfer_v2.model.lkml"

explore: timeseries_data {}

# If necessary, uncomment the line below to include explore_source.
# include: "block_google_ads_transfer_v2.model.lkml"

view: timeseries_training_data {
  derived_table: {
    explore_source: ad_basic_stats {
      column: date { field: fact.date_date }
      column: total_clicks { field: fact.total_clicks }
      filters: {
        field: fact.date_date
        value: "364 days ago for 363 days"
      }
    }
  }
  dimension: date {
    #label: "Ad Performance (Current Period)  Date"
    type: date
  }
  dimension: total_clicks {
    #label: "Ad Performance (Current Period) Clicks"
    description: "Total ad clicks."
    #value_format: "[>=1000000]0.00,,"M";[>=1000]0.00,"K";0"
    type: number
  }
}



view: timeseries_data {
  derived_table: {
    explore_source: ad_basic_stats {
      column: total_clicks { field: fact.total_clicks }
      column: date { field: fact.date_date }
      filters: {
        field: fact.period
        value: "364 day"
      }
      filters: {
        field: ad_group.ad_group_name
        value: ""
      }
    }
    sql_trigger_value: select current_date ;;
  }
  dimension: total_clicks {
    #label: "Ad Performance (Current Period) Clicks"
    description: "Total ad clicks."
    #value_format: "[>=1000000]0.00,,"M";[>=1000]0.00,"K";0"
    type: number
  }
  dimension: date {
    #label: "Ad Performance (Current Period)  Date"
    type: date
  }
}

view: arima {
  # 2019-08-21 Bruce - Set max iterations down to 50 from 100.  Getting error saying max allowable is 50
  derived_table: {
    #datagroup_trigger: sweet_datagroup
    sql_trigger_value: select current_date ;;
    sql_create:
      CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
      OPTIONS
       (model_type = 'ARIMA',
        time_series_timestamp_col = 'date',
        time_series_data_col = 'total_clicks',
        auto_arima = TRUE,
        data_frequency = 'AUTO_FREQUENCY'
      ) AS

      SELECT
        date,
        SUM(total_clicks) AS total_clicks
      FROM
       ${timeseries_training_data.SQL_TABLE_NAME}
      GROUP BY date;;
  }
}

#explore: arima_eval {}
view: arima_eval  {
  #Inspect the evaluation metrics of all evaluated models
  derived_table: {
  sql: SELECT
      *
      FROM
    ML.EVALUATE(MODEL ${arima.SQL_TABLE_NAME}) ;;
  }

  dimension: non_seasonal_p {
    type: number
    sql: ${TABLE}.non_seasonal_p ;;
  }

  dimension: non_seasonal_d {
    type: number
    sql: ${TABLE}.non_seasonal_d ;;
  }

  dimension: non_seasonal_q {
    type: number
    sql: ${TABLE}.non_seasonal_q ;;
  }

  dimension: has_drift {
    type: string
    sql: ${TABLE}.has_drift ;;
  }

  dimension: log_likelihood {
    type: number
    sql: ${TABLE}.log_likelihood ;;
  }

  dimension: aic {
    type: number
    sql: ${TABLE}.AIC ;;
  }

  dimension: variance {
    type: number
    sql: ${TABLE}.variance ;;
  }

  dimension: seasonal_periods {
    type: string
    sql: ${TABLE}.seasonal_periods ;;
  }

}


#explore:arima_coef  {}
view: arima_coef  {
  #Inspect the evaluation metrics of all evaluated models
  derived_table: {
    sql: SELECT
 *
FROM
 ML.ARIMA_COEFFICIENTS(MODEL ${arima.SQL_TABLE_NAME}) ;;
  }

  dimension: ar_coefficients {
    type: number
    sql: ${TABLE}.ar_coefficients ;;
  }

  dimension: ma_coefficients {
    type: number
    sql: ${TABLE}.ma_coefficients ;;
  }

  dimension: intercept_or_drift {
    type: number
    sql: ${TABLE}.intercept_or_drift ;;
  }

}

view: arima_forecast {
  derived_table: {
    sql: SELECT
  *
FROM
  ML.FORECAST(MODEL ${arima.SQL_TABLE_NAME},
              STRUCT(30 AS horizon, 0.8 AS confidence_level)) ;;
  }

  dimension_group: forecast_timestamp {
    type: time
    sql: ${TABLE}.forecast_timestamp ;;
  }

  dimension: forecast_value {
    type: number
    sql: ${TABLE}.forecast_value ;;
  }

  dimension: standard_error {
    type: number
    sql: ${TABLE}.standard_error ;;
  }

  dimension: confidence_level {
    type: number
    sql: ${TABLE}.confidence_level ;;
  }

  dimension: prediction_interval_lower_bound {
    type: number
    sql: ${TABLE}.prediction_interval_lower_bound ;;
  }

  dimension: prediction_interval_upper_bound {
    type: number
    sql: ${TABLE}.prediction_interval_upper_bound ;;
  }

  dimension: confidence_interval_lower_bound {
    type: number
    sql: ${TABLE}.confidence_interval_lower_bound ;;
  }

  dimension: confidence_interval_upper_bound {
    type: number
    sql: ${TABLE}.confidence_interval_upper_bound ;;
  }
}

explore: arima_forecast_results {}

view: arima_forecast_results {
  derived_table: {
    sql_trigger_value: select current_date ;;
    sql:
SELECT
 history_timestamp AS timestamp,
 history_value,
 NULL AS forecast_value,
 NULL AS prediction_interval_lower_bound,
 NULL AS prediction_interval_upper_bound
FROM
 (
   SELECT
     date AS history_timestamp,
     sum(total_clicks) AS history_value
   FROM
     ${timeseries_data.SQL_TABLE_NAME}
   GROUP BY date
   ORDER BY date ASC
 )
UNION ALL
SELECT
 forecast_timestamp AS timestamp,
 NULL AS history_value,
 forecast_value,
 prediction_interval_lower_bound,
 prediction_interval_upper_bound
FROM
 ML.FORECAST(MODEL ${arima.SQL_TABLE_NAME},
             STRUCT(30 AS horizon, 0.8 AS confidence_level));;
  }


  dimension_group: timestamp {
    type: time
    sql: ${TABLE}.timestamp ;;
  }

  dimension: history_value {
    type: number
    sql: ${TABLE}.history_value ;;
  }

  dimension: forecast_value {
    type: number
    sql: ${TABLE}.forecast_value ;;
  }

  dimension: prediction_interval_lower_bound {
    type: number
    sql: ${TABLE}.prediction_interval_lower_bound ;;
  }

  dimension: prediction_interval_upper_bound {
    type: number
    sql: ${TABLE}.prediction_interval_upper_bound ;;
  }


  dimension: clicks {
    sql: ROUND(IFNULL(${history_value},0) + IFNULL(${forecast_value},0));;
    type: number
  }

  ####

  measure: lower_bound {
    type: sum
    sql: ${prediction_interval_lower_bound} ;;
  }

  measure: upper_bound {
    type: sum
    sql: ${prediction_interval_upper_bound} ;;
  }



  measure: total_clicks_forecasted {
    type: number
    sql: nullif(sum(${forecast_value}),0);;
  }

  measure: total_clicks_history {
    type: number
    sql: nullif(sum(${history_value}),0) ;;
  }








}
