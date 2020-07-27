connection: "@{CONNECTION_NAME}"

include: "upstream_views/*"
#include: "lookml_dashboards/*"
include: "lookml_dashboards/google_ads_pulse.dashboard"


named_value_format: large_number { value_format: "[>=1000000]0.00,,\"M\";[>=1000]0.00,\"K\";0"}
named_value_format: usd_large { value_format: "[>=1000000]$0.00,,\"M\";[>=1000]$0.00,\"K\";$0.00" }

explore: ad_basic_stats {
  view_label: "Ad Performance (Current Period)"
  description: "Ad Performance including Ad Groups, Keywords and Campaigns"
  view_name: fact
  from: ad_basic_stats

  conditionally_filter: {
    filters: [
                fact.period: "28 day",
                fact.date_period_latest: "yes"
              ]
    unless: [fact.date_date]
  }



  join: last_fact {
    from: ad_stats
    view_label: "Ad Performance (Last Period)"
    sql_on:
      ${fact.external_customer_id} = ${last_fact.external_customer_id} AND
      ${fact.campaign_id} = ${last_fact.campaign_id} AND
      ${fact.ad_group_id} = ${last_fact.ad_group_id} AND
      ${fact.criterion_id} = ${last_fact.criterion_id} AND
      ${fact.creative_id} = ${last_fact.creative_id} AND
      ${fact.date_last_period} = ${last_fact.date_period} AND
      ${fact.date_day_of_period} = ${last_fact.date_day_of_period} ;;
    relationship: many_to_many
  }

  join: ad {
    from: ad
    view_label: "Ads"
    sql_on: ${fact.creative_id} = ${ad.creative_id} AND
      ${fact.ad_group_id} = ${ad.ad_group_id} AND
      ${fact.campaign_id} = ${ad.campaign_id} AND
      ${fact.external_customer_id} = ${ad.external_customer_id} AND
      ${ad.latest} ;;
    relationship:  many_to_one
  }

  join: ad_group {
    fields: [ad_group.ad_group_name]
    from: ad_group
    view_label: "Ad Groups"
    sql_on: ${fact.ad_group_id} = ${ad_group.ad_group_id} AND
      ${fact.campaign_id} = ${ad_group.campaign_id} AND
      ${fact.external_customer_id} = ${ad_group.external_customer_id} AND
      ${ad_group.latest} ;;
    relationship: many_to_one
  }

  join: keyword {
    fields: [keyword.criteria,keyword.criteria_destination_url]
    from: keyword
    view_label: "Keyword"
    sql_on: ${fact.criterion_id} = ${keyword.criterion_id} AND
            ${fact.ad_group_id} = ${keyword.ad_group_id} AND
            ${fact.campaign_id} = ${keyword.campaign_id} AND
            ${fact.external_customer_id} = ${keyword.external_customer_id} AND
            ${keyword.latest} ;;
    relationship: many_to_one
  }

  join: customer {
    view_label: "Customer"
    sql_on: ${fact.external_customer_id} = ${customer.external_customer_id} AND
      ${customer.latest} ;;
    relationship: many_to_one
  }

  join: campaign {
    view_label: "Campaign"
    sql_on: ${fact.campaign_id} = ${campaign.campaign_id} AND
      ${fact.external_customer_id} = ${campaign.external_customer_id} AND
      ${campaign.latest};;
    relationship: many_to_one
  }

}




# include: "*.dashboard"
# include: "*.view"

# # Daily Account Aggregation
# explore: ad_impressions {
#   extends: [ad_impressions_config]
#   hidden: yes
# }

# explore: ad_impressions_daily {
#   extends: [ad_impressions_daily_config]
#   hidden: yes
# }


# explore: ad_impressions_campaign {
#   extends: [ad_impressions_campaign_config]
# }

# explore: ad_impressions_campaign_daily {
#   extends: [ad_impressions_campaign_daily_config]
#   hidden: yes
# }

# explore: ad_impressions_ad_group {
#   extends: [ad_impressions_ad_group_config]
#   hidden: yes
# }

# explore: ad_impressions_ad_group_hour {
#   extends: [ad_impressions_ad_group_hour_config]
#   hidden: yes
# }

# explore: ad_impressions_ad {
#   extends: [ad_impressions_ad_config]
# }

# explore: ad_impressions_keyword {
#   extends: [ad_impressions_keyword_config]
#   hidden: yes
# }

# explore: ad_impressions_geo {
#   extends: [ad_impressions_geo_config]
#   hidden: yes
# }

# explore: ad_impressions_age_range {
#   extends: [ad_impressions_age_range_config]
#   hidden: yes
# }

# explore: ad_impressions_gender {
#   extends: [ad_impressions_gender_config]
#   hidden: yes
# }

# explore: ad_impressions_audience {
#   extends: [ad_impressions_audience_config]
#   hidden: yes
# }

# explore: ad_impressions_parental_status {
#   extends: [ad_impressions_parental_status_config]
#   hidden: yes
# }

# explore: ad_impressions_video {
#   extends: [ad_impressions_video_config]
#   hidden: yes
# }

# explore: adwords_period_comparison {
#   extends: [adwords_period_comparison_config]
# }
