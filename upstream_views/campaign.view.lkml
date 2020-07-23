view: campaign {
  sql_table_name: `@{GOOGLE_ADS_SCHEMA}.Campaign_@{GOOGLE_ADS_CUSTOMER_ID}` ;;


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


  dimension: advertising_channel_sub_type {
    group_label: "Campaign Attributes"
    description: "Optional refinement of the campaign's AdvertisingChannelType."
    type: string
    sql: ${TABLE}.AdvertisingChannelSubType ;;
  }

  dimension: advertising_channel_type {
    group_label: "Campaign Attributes"
    type: string
    sql: ${TABLE}.AdvertisingChannelType ;;
  }

  dimension: amount {
    description: "The daily budget amount"
    type: number
    sql: ${TABLE}.Amount / 10000 ;;
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.BidType ;;
  }

  dimension: bidding_strategy_id {
    type: number
    sql: ${TABLE}.BiddingStrategyId ;;
  }

  dimension: bidding_strategy_name {
    type: string
    sql: ${TABLE}.BiddingStrategyName ;;
  }

  dimension: bidding_strategy_type {
    type: string
    sql: ${TABLE}.BiddingStrategyType ;;
  }

  dimension: budget_id {
    type: number
    sql: ${TABLE}.BudgetId ;;
  }

  dimension: campaign_desktop_bid_modifier {
    type: number
    sql: ${TABLE}.CampaignDesktopBidModifier ;;
  }

  dimension: campaign_group_id {
    type: number
    sql: ${TABLE}.CampaignGroupId ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: campaign_mobile_bid_modifier {
    type: number
    sql: ${TABLE}.CampaignMobileBidModifier ;;
  }

  dimension: campaign_name {
    alias: [name]
    type: string
    sql: ${TABLE}.CampaignName ;;
  }

  dimension: campaign_status {
    type: string
    sql: ${TABLE}.CampaignStatus ;;
  }

  dimension: campaign_tablet_bid_modifier {
    type: number
    sql: ${TABLE}.CampaignTabletBidModifier ;;
  }

  dimension: campaign_trial_type {
    type: string
    sql: ${TABLE}.CampaignTrialType ;;
  }

  dimension_group: end {
    description: "the end date of the campaign"
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
    sql: ${TABLE}.EndDate ;;
  }

  dimension: enhanced_cpc_enabled {
    type: yesno
    sql: ${TABLE}.EnhancedCpcEnabled ;;
  }

  dimension: enhanced_cpv_enabled {
    type: yesno
    sql: ${TABLE}.EnhancedCpvEnabled ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: has_recommended_budget {
    type: yesno
    sql: ${TABLE}.HasRecommendedBudget ;;
  }

  dimension: is_budget_explicitly_shared {
    type: yesno
    sql: ${TABLE}.IsBudgetExplicitlyShared ;;
  }

  dimension: label_ids {
    type: string
    sql: ${TABLE}.LabelIds ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.Labels ;;
  }

  dimension: maximize_conversion_value_target_roas {
    type: number
    sql: ${TABLE}.MaximizeConversionValueTargetRoas ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.Period ;;
  }

  dimension: recommended_budget_amount {
    type: string
    sql: ${TABLE}.RecommendedBudgetAmount ;;
  }

  dimension: serving_status {
    type: string
    sql: ${TABLE}.ServingStatus ;;
  }

  dimension_group: start {
    description: "the start date of the campaign"
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
    sql: ${TABLE}.StartDate ;;
  }

  dimension: total_amount {
    type: string
    sql: ${TABLE}.TotalAmount ;;
  }

  dimension: tracking_url_template {
    type: string
    sql: ${TABLE}.TrackingUrlTemplate ;;
  }

  dimension: url_custom_parameters {
    type: string
    sql: ${TABLE}.UrlCustomParameters ;;
  }

  measure: count {
    type: count
    drill_fields: [campaign_name, bidding_strategy_name]
  }
}
