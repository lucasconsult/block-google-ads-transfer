include: "//@{CONFIG_PROJECT_NAME}/views/ad_group.view.lkml"


view: ad_group {
  extends: [ad_group_config]
}

###################################################

view: ad_group_core {
  sql_table_name: `@{GOOGLE_ADS_SCHEMA}.AdGroup_@{GOOGLE_ADS_CUSTOMER_ID}`    ;;


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

  dimension: ad_group_desktop_bid_modifier {
    type: number
    sql: ${TABLE}.AdGroupDesktopBidModifier ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.AdGroupId ;;
  }

  dimension: ad_group_mobile_bid_modifier {
    type: number
    sql: ${TABLE}.AdGroupMobileBidModifier ;;
  }

  dimension: ad_group_name {
    drill_fields: [keyword.criteria]
    type: string
    sql: ${TABLE}.AdGroupName ;;
    link: {
      label: "View on Google Ads"
      icon_url: "https://www.google.com/s2/favicons?domain=www.ads.google.com"
      url: "https://ads.google.com/aw/adgroups"
    }
  }


  dimension: ad_group_status {
    type: string
    sql: ${TABLE}.AdGroupStatus ;;
  }

  dimension: ad_group_tablet_bid_modifier {
    type: number
    sql: ${TABLE}.AdGroupTabletBidModifier ;;
  }

  dimension: ad_group_type {
    type: string
    sql: ${TABLE}.AdGroupType ;;
  }

  dimension: ad_rotation_mode {
    type: string
    sql: ${TABLE}.AdRotationMode ;;
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

  dimension: bidding_strategy_source {
    type: string
    sql: ${TABLE}.BiddingStrategySource ;;
  }

  dimension: bidding_strategy_type {
    type: string
    sql: ${TABLE}.BiddingStrategyType ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: content_bid_criterion_type_group {
    type: string
    sql: ${TABLE}.ContentBidCriterionTypeGroup ;;
  }

  dimension: cpc_bid {
    type: string
    sql: ${TABLE}.CpcBid ;;
  }

  dimension: cpm_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.CpmBid ;;
  }

  dimension: cpm_bid_str {
    type: string
    sql: ${TABLE}.CpmBidStr ;;
  }

  dimension: cpv_bid {
    type: string
    sql: ${TABLE}.CpvBid ;;
  }

  dimension: effective_target_roas {
    type: number
    sql: ${TABLE}.EffectiveTargetRoas ;;
  }

  dimension: effective_target_roas_source {
    type: string
    sql: ${TABLE}.EffectiveTargetRoasSource ;;
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

  dimension: label_ids {
    type: string
    sql: ${TABLE}.LabelIds ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.Labels ;;
  }

  dimension: target_cpa {
    type: number
    sql: ${TABLE}.TargetCpa ;;
  }

  dimension: target_cpa_bid_source {
    type: string
    sql: ${TABLE}.TargetCpaBidSource ;;
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
    drill_fields: [ad_group_name, bidding_strategy_name]
  }
}
