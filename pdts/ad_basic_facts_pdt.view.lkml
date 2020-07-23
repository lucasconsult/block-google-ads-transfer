view: ad_basic_facts_pdt {

    derived_table: {
     # datagroup_trigger: adwords_etl_datagroup
      explore_source: ad_impressions_ad {
        column: _date { field: fact.date_date }
        column: external_customer_id { field: fact.external_customer_id }
        column: campaign_id {field: fact.campaign_id}
        column: ad_group_id {field: fact.ad_group_id}
        column: criterion_id {field: fact.criterion_id}
        column: creative_id { field: fact.creative_id }
        column: averageposition {field: fact.weighted_average_position}
        column: clicks {field: fact.total_clicks }
        column: conversions {field: fact.total_conversions}
        column: conversionvalue {field: fact.total_conversionvalue}
        column: cost {field: fact.total_cost}
        column: impressions { field: fact.total_impressions}
        column: interactions {field: fact.total_interactions}
      }
    }
    dimension: creative_id {
      hidden: yes
    }
  }
