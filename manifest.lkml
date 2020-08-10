# project_name: "block-google-ads-transfer"

constant: CONNECTION_NAME {
  value: "looker_application"
  export: override_required
}

constant: GOOGLE_ADS_SCHEMA {
  value: "bigquery-connectors.adwords_v201609"
  export: override_required
}

constant: GOOGLE_ADS_CUSTOMER_ID {
  value: "6747157124"
  export: override_required
}

constant: CONFIG_PROJECT_NAME {
  value: "block-google-ads-transfer-v2-config"
  export: override_required
}


local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  override_constant: GOOGLE_ADS_SCHEMA {
    value: "@{GOOGLE_ADS_SCHEMA}"
  }

  override_constant: GOOGLE_ADS_CUSTOMER_ID {
    value: "@{GOOGLE_ADS_CUSTOMER_ID}"
  }

}
