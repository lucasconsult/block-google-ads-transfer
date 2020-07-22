project_name: "block-google-ads-transfer"

# Library of common ad metrics definitions and date periods
remote_dependency: app-marketing-common {
  url: "git://github.com/looker/app-marketing-common-bigquery"
  ref: "d0405a8ef76925449d722b11103f419b3d40e37b"
}

remote_dependency: app-marketing-google-ads-adapter {
  url: "git://github.com/looker/app-marketing-google-ads-transfer-bigquery"
  ref: "cd6585b2049e89a4c0a985550e303b9fcaf1bbdd"
}

remote_dependency: app-marketing-google-ads {
  url: "git://github.com/looker/app-marketing-google-ads"
  ref: "858973420837f60f27f6ffa30a431e755d61de7a"
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

constant: CONFIG_PROJECT_NAME {
  value: "block-google-ads-transfer-config"
  export: override_required
}

constant: CONNECTION_NAME {
  value: "looker_application"
  export: override_required
}

constant: GOOGLE_ADS_SCHEMA {
  value: "adwords_v201609"
  export: override_required
}

constant: GOOGLE_ADS_CUSTOMER_ID {
  value: "12345"
  export: override_required
}
