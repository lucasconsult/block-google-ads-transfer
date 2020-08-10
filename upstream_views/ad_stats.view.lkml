include: /shared_views/*

include: "//@{CONFIG_PROJECT_NAME}/views/ad_stats.view.lkml"


view: ad_stats {
  extends: [ad_stats_config]
}

###################################################

view: ad_stats_core {
  sql_table_name: (select *,GENERATE_UUID() as primary_key from `@{GOOGLE_ADS_SCHEMA}.AdStats_@{GOOGLE_ADS_CUSTOMER_ID}` )   ;;
  extends: [ads_common,date_base,period_base]

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.primary_key ;;
  }

  dimension: _date {
    hidden: yes
    type: date_raw
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension_group: _data {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._DATA_DATE ;;
  }

  dimension_group: _latest {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._LATEST_DATE ;;
  }

  dimension: latest {
    hidden: yes
    type: yesno
    sql: ${_data_raw} = ${_latest_raw} ;;
  }

  dimension: active_view_impressions {
    type: number
    sql: ${TABLE}.ActiveViewImpressions ;;
  }

  dimension: active_view_measurability {
    type: number
    sql: ${TABLE}.ActiveViewMeasurability ;;
  }

  dimension: active_view_measurable_cost {
    type: number
    sql: ${TABLE}.ActiveViewMeasurableCost ;;
  }

  dimension: active_view_measurable_impressions {
    type: number
    sql: ${TABLE}.ActiveViewMeasurableImpressions ;;
  }

  dimension: active_view_viewability {
    type: number
    sql: ${TABLE}.ActiveViewViewability ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.AdGroupId ;;
  }

  dimension: ad_network_type1 {
    type: string
    sql: ${TABLE}.AdNetworkType1 ;;
  }

  dimension: ad_network_type2 {
    type: string
    sql: ${TABLE}.AdNetworkType2 ;;
  }

  dimension: average_position {
    type: number
    sql: ${TABLE}.AveragePosition ;;
  }

  dimension: base_ad_group_id {
    type: number
    sql: ${TABLE}.BaseAdGroupId ;;
  }

  dimension: base_campaign_id {
    type: number
    sql: ${TABLE}.BaseCampaignId ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  dimension: conversion_value {
    type: number
    sql: ${TABLE}.ConversionValue ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.Conversions ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.Cost / 1000000.0 ;;
  }

  dimension: creative_id {
    type: number
    sql: ${TABLE}.CreativeId ;;
  }

  dimension: criterion_id {
    type: number
    sql: ${TABLE}.CriterionId ;;
  }

  dimension: criterion_type {
    type: string
    sql: ${TABLE}.CriterionType ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      day_of_week_index,
      day_of_month,
      day_of_year,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.Device ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.Impressions ;;
  }

  dimension: interaction_types {
    type: string
    sql: ${TABLE}.InteractionTypes ;;
  }

  dimension: interactions {
    type: number
    sql: ${TABLE}.Interactions ;;
  }

  dimension: is_negative {
    type: yesno
    sql: ${TABLE}.IsNegative ;;
  }

  dimension: slot {
    type: string
    sql: ${TABLE}.Slot ;;
  }

  dimension: view_through_conversions {
    type: number
    sql: ${TABLE}.ViewThroughConversions ;;
  }



  dimension: active_view_cpm {
    hidden: yes
    type: number
    sql: ${TABLE}.ActiveViewCpm ;;
  }

  dimension: active_view_ctr {
    hidden: yes
    type: number
    sql: ${TABLE}.ActiveViewCtr ;;
  }

  dimension: average_cost {
    hidden: yes
    type: number
    sql: ${TABLE}.AverageCost ;;
  }

  dimension: average_cpc {
    hidden: yes
    type: number
    sql: ${TABLE}.AverageCpc ;;
  }

  dimension: average_cpm {
    hidden: yes
    type: number
    sql: ${TABLE}.AverageCpm ;;
  }

  dimension: click_type {
    type: string
    sql: ${TABLE}.ClickType ;;
  }

  dimension: conversion_rate {
    type: number
    sql: ${TABLE}.ConversionRate ;;
  }

  dimension: cost_per_conversion {
    type: number
    sql: ${TABLE}.CostPerConversion ;;
  }

  dimension: cost_per_current_model_attributed_conversion {
    type: number
    sql: ${TABLE}.CostPerCurrentModelAttributedConversion ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.Ctr ;;
  }

  dimension: current_model_attributed_conversion_value {
    type: number
    sql: ${TABLE}.CurrentModelAttributedConversionValue ;;
  }

  dimension: current_model_attributed_conversions {
    type: number
    sql: ${TABLE}.CurrentModelAttributedConversions ;;
  }

  dimension: gmail_forwards {
    type: number
    sql: ${TABLE}.GmailForwards ;;
  }

  dimension: gmail_saves {
    type: number
    sql: ${TABLE}.GmailSaves ;;
  }

  dimension: gmail_secondary_clicks {
    type: number
    sql: ${TABLE}.GmailSecondaryClicks ;;
  }

  dimension: interaction_rate {
    type: number
    sql: ${TABLE}.InteractionRate ;;
  }

  dimension: value_per_conversion {
    type: number
    sql: ${TABLE}.ValuePerConversion ;;
  }

  dimension: value_per_current_model_attributed_conversion {
    type: number
    sql: ${TABLE}.ValuePerCurrentModelAttributedConversion ;;
  }


}
