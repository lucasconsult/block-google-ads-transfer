# project_name: "block-google-ads-transfer"

constant: CONNECTION_NAME {
  value: "bigquery_city_trips"
  export: override_optional
}

constant: GOOGLE_ADS_SCHEMA {
  value: "hvar_google_ads"
  export: override_optional
}

constant: GOOGLE_ADS_CUSTOMER_ID {
  value: "4501760809"
  export: override_optional
}

new_lookml_runtime: no
project_name: "Google Ads"
