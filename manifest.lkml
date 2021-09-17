# project_name: "block-google-ads-transfer"

constant: CONNECTION_NAME {
  value: "4mile_bigquery"
  # value: "connection"
  export: override_required
}

constant: GOOGLE_ADS_SCHEMA {
  value: "schema"
  export: override_required
}

constant: GOOGLE_ADS_CUSTOMER_ID {
  value: "12345"
  export: override_required
}
