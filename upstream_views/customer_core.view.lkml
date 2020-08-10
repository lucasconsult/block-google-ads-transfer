include: /shared_views/*

include: "//@{CONFIG_PROJECT_NAME}/views/customer.view.lkml"


view: customer {
  extends: [customer_config]
}

###################################################

view: customer_core {
  sql_table_name: `@{GOOGLE_ADS_SCHEMA}.Customer_@{GOOGLE_ADS_CUSTOMER_ID}` ;;

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


  dimension: account_currency_code {
    type: string
    sql: ${TABLE}.AccountCurrencyCode ;;
  }

  dimension: account_descriptive_name {
    type: string
    sql: ${TABLE}.AccountDescriptiveName ;;
  }

  dimension: account_time_zone {
    type: string
    sql: ${TABLE}.AccountTimeZone ;;
  }

  dimension: account_time_zone_id {
    type: string
    sql: ${TABLE}.AccountTimeZoneId ;;
  }

  dimension: can_manage_clients {
    type: yesno
    sql: ${TABLE}.CanManageClients ;;
  }

  dimension: customer_descriptive_name {
    drill_fields: [campaign.campaign_name]
    type: string
    sql: ${TABLE}.CustomerDescriptiveName ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: is_auto_tagging_enabled {
    type: yesno
    sql: ${TABLE}.IsAutoTaggingEnabled ;;
  }

  dimension: is_test_account {
    type: yesno
    sql: ${TABLE}.IsTestAccount ;;
  }

  dimension: primary_company_name {
    type: string
    sql: ${TABLE}.PrimaryCompanyName ;;
  }

  measure: count {
    type: count
    drill_fields: [account_descriptive_name, customer_descriptive_name, primary_company_name]
  }
}
