# If necessary, uncomment the line below to include explore_source.
# include: "block_google_ads_transfer_v2.model.lkml"

explore: timeseries_data {}
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
    sql_trigger_value: select 1 ;;
  }
  dimension: total_clicks {
    label: "Ad Performance (Current Period) Clicks"
    description: "Total ad clicks."
    #value_format: "[>=1000000]0.00,,"M";[>=1000]0.00,"K";0"
    type: number
  }
  dimension: date {
    label: "Ad Performance (Current Period)  Date"
    type: date
  }
}

view: arima {
  # 2019-08-21 Bruce - Set max iterations down to 50 from 100.  Getting error saying max allowable is 50
  derived_table: {
    datagroup_trigger: sweet_datagroup
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
       *
      FROM
       ${timeseries_data.SQL_TABLE_NAME}
      GROUP BY date;;
  }
}

view: arima_eval  {
  #Inspect the evaluation metrics of all evaluated models
derived_table: {
  sql: SELECT
 *
FROM
 ML.EVALUATE(MODEL ${arima.SQL_TABLE_NAME}) ;;
}

}


view: arima_coef  {
  #Inspect the evaluation metrics of all evaluated models
  derived_table: {
    sql: SELECT
 *
FROM
 ML.ARIMA_COEFFICIENTS(MODEL ${arima.SQL_TABLE_NAME}) ;;
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
}


view: arima_forecast_results {
  derived_table: {
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
     PARSE_TIMESTAMP("%Y%m%d", date) AS history_timestamp,
     total_cliocks AS history_value
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
}
