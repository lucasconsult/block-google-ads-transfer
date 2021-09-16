include: "//@{CONFIG_PROJECT_NAME}/views/ad.view.lkml"


view: ad {
  extends: [ad_config]
}

###################################################

view: ad_core {
  sql_table_name: `@{GOOGLE_ADS_SCHEMA}.Ad_@{GOOGLE_ADS_CUSTOMER_ID}` ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${campaign_id},${creative_id}) ;;
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


  dimension: accent_color {
    type: string
    sql: ${TABLE}.AccentColor ;;
  }

  dimension: ad_group_ad_disapproval_reasons {
    type: string
    sql: ${TABLE}.AdGroupAdDisapprovalReasons ;;
  }

  dimension: ad_group_ad_trademark_disapproved {
    type: yesno
    sql: ${TABLE}.AdGroupAdTrademarkDisapproved ;;
  }

  dimension: ad_group_id {
    hidden: yes
    type: number
    sql: ${TABLE}.AdGroupId ;;
  }

  dimension: ad_strength_info {
    type: string
    sql: ${TABLE}.AdStrengthInfo ;;
  }

  dimension: ad_type {
    type: string
    sql: ${TABLE}.AdType ;;
  }

  dimension: allow_flexible_color {
    type: yesno
    sql: ${TABLE}.AllowFlexibleColor ;;
  }

  dimension: automated {
    type: yesno
    sql: ${TABLE}.Automated ;;
  }

  dimension: business_name {
    type: string
    sql: ${TABLE}.BusinessName ;;
  }

  dimension: call_only_phone_number {
    type: string
    sql: ${TABLE}.CallOnlyPhoneNumber ;;
  }

  dimension: call_to_action_text {
    type: string
    sql: ${TABLE}.CallToActionText ;;
  }

  dimension: campaign_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: combined_approval_status {
    type: string
    sql: ${TABLE}.CombinedApprovalStatus ;;
  }

  dimension: creative_approval_status {
    type: string
    sql: ${TABLE}.CreativeApprovalStatus ;;
  }

  dimension: creative_destination_url {
    type: string
    sql: ${TABLE}.CreativeDestinationUrl ;;
  }

  dimension: creative_final_app_urls {
    type: string
    sql: ${TABLE}.CreativeFinalAppUrls ;;
  }

  dimension: creative_final_mobile_urls {
    type: string
    sql: ${TABLE}.CreativeFinalMobileUrls ;;
  }

  dimension: creative_final_urls {
    type: string
    sql: ${TABLE}.CreativeFinalUrls ;;
  }

  dimension: creative_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CreativeId ;;
  }

  dimension: creative_tracking_url_template {
    type: string
    sql: ${TABLE}.CreativeTrackingUrlTemplate ;;
  }

  dimension: creative_url_custom_parameters {
    type: string
    sql: ${TABLE}.CreativeUrlCustomParameters ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
    drill_fields: [keyword.criteria]
  }

  dimension: description1 {
    type: string
    sql: ${TABLE}.Description1 ;;
  }

  dimension: description2 {
    type: string
    sql: ${TABLE}.Description2 ;;
  }

  dimension: device_preference {
    type: number
    sql: ${TABLE}.DevicePreference ;;
  }

  dimension: display_url {
    type: string
    sql: ${TABLE}.DisplayUrl ;;
  }

  dimension: enhanced_display_creative_landscape_logo_image_media_id {
    type: number
    sql: ${TABLE}.EnhancedDisplayCreativeLandscapeLogoImageMediaId ;;
  }

  dimension: enhanced_display_creative_logo_image_media_id {
    type: number
    sql: ${TABLE}.EnhancedDisplayCreativeLogoImageMediaId ;;
  }

  dimension: enhanced_display_creative_marketing_image_media_id {
    type: number
    sql: ${TABLE}.EnhancedDisplayCreativeMarketingImageMediaId ;;
  }

  dimension: enhanced_display_creative_marketing_image_square_media_id {
    type: number
    sql: ${TABLE}.EnhancedDisplayCreativeMarketingImageSquareMediaId ;;
  }

  dimension: expanded_dynamic_search_creative_description2 {
    type: string
    sql: ${TABLE}.ExpandedDynamicSearchCreativeDescription2 ;;
  }

  dimension: expanded_text_ad_description2 {
    type: string
    sql: ${TABLE}.ExpandedTextAdDescription2 ;;
  }

  dimension: expanded_text_ad_headline_part3 {
    type: string
    sql: ${TABLE}.ExpandedTextAdHeadlinePart3 ;;
  }

  dimension: external_customer_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: format_setting {
    type: string
    sql: ${TABLE}.FormatSetting ;;
  }

  dimension: gmail_creative_header_image_media_id {
    type: number
    sql: ${TABLE}.GmailCreativeHeaderImageMediaId ;;
  }

  dimension: gmail_creative_logo_image_media_id {
    type: number
    sql: ${TABLE}.GmailCreativeLogoImageMediaId ;;
  }

  dimension: gmail_creative_marketing_image_media_id {
    type: number
    sql: ${TABLE}.GmailCreativeMarketingImageMediaId ;;
  }

  dimension: gmail_teaser_business_name {
    type: string
    sql: ${TABLE}.GmailTeaserBusinessName ;;
  }

  dimension: gmail_teaser_description {
    type: string
    sql: ${TABLE}.GmailTeaserDescription ;;
  }

  dimension: gmail_teaser_headline {
    type: string
    sql: ${TABLE}.GmailTeaserHeadline ;;
  }

  dimension: headline {
    type: string
    sql: ${TABLE}.Headline ;;
  }

  dimension: headline_part1 {
    type: string
    sql: ${TABLE}.HeadlinePart1 ;;
  }

  dimension: headline_part2 {
    type: string
    sql: ${TABLE}.HeadlinePart2 ;;
  }

  dimension: image_ad_url {
    type: string
    sql: ${TABLE}.ImageAdUrl ;;
  }

  dimension: image_creative_image_height {
    type: number
    sql: ${TABLE}.ImageCreativeImageHeight ;;
  }

  dimension: image_creative_image_width {
    type: number
    sql: ${TABLE}.ImageCreativeImageWidth ;;
  }

  dimension: image_creative_mime_type {
    type: string
    sql: ${TABLE}.ImageCreativeMimeType ;;
  }

  dimension: image_creative_name {
    type: string
    sql: ${TABLE}.ImageCreativeName ;;
  }

  dimension: label_ids {
    hidden: yes
    type: string
    sql: ${TABLE}.LabelIds ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.Labels ;;
  }

  dimension: long_headline {
    type: string
    sql: ${TABLE}.LongHeadline ;;
  }

  dimension: main_color {
    type: string
    sql: ${TABLE}.MainColor ;;
  }

  dimension: marketing_image_call_to_action_text {
    type: string
    sql: ${TABLE}.MarketingImageCallToActionText ;;
  }

  dimension: marketing_image_call_to_action_text_color {
    type: string
    sql: ${TABLE}.MarketingImageCallToActionTextColor ;;
  }

  dimension: marketing_image_description {
    type: string
    sql: ${TABLE}.MarketingImageDescription ;;
  }

  dimension: marketing_image_headline {
    type: string
    sql: ${TABLE}.MarketingImageHeadline ;;
  }

  dimension: multi_asset_responsive_display_ad_accent_color {
    type: string
    sql: ${TABLE}.MultiAssetResponsiveDisplayAdAccentColor ;;
  }

  dimension: multi_asset_responsive_display_ad_business_name {
    type: string
    sql: ${TABLE}.MultiAssetResponsiveDisplayAdBusinessName ;;
  }

  dimension: multi_asset_responsive_display_ad_call_to_action_text {
    type: string
    sql: ${TABLE}.MultiAssetResponsiveDisplayAdCallToActionText ;;
  }

  dimension: multi_asset_responsive_display_ad_descriptions {
    type: string
    sql: ${TABLE}.MultiAssetResponsiveDisplayAdDescriptions ;;
  }

  dimension: multi_asset_responsive_display_ad_dynamic_settings_price_prefix {
    type: string
    sql: ${TABLE}.MultiAssetResponsiveDisplayAdDynamicSettingsPricePrefix ;;
  }

  dimension: multi_asset_responsive_display_ad_dynamic_settings_promo_text {
    type: string
    sql: ${TABLE}.MultiAssetResponsiveDisplayAdDynamicSettingsPromoText ;;
  }

  dimension: multi_asset_responsive_display_ad_format_setting {
    type: string
    sql: ${TABLE}.MultiAssetResponsiveDisplayAdFormatSetting ;;
  }

  dimension: multi_asset_responsive_display_ad_headlines {
    type: string
    sql: ${TABLE}.MultiAssetResponsiveDisplayAdHeadlines ;;
  }

  dimension: multi_asset_responsive_display_ad_landscape_logo_images {
    type: string
    sql: ${TABLE}.MultiAssetResponsiveDisplayAdLandscapeLogoImages ;;
  }

  dimension: multi_asset_responsive_display_ad_logo_images {
    type: string
    sql: ${TABLE}.MultiAssetResponsiveDisplayAdLogoImages ;;
  }

  dimension: multi_asset_responsive_display_ad_long_headline {
    type: string
    sql: ${TABLE}.MultiAssetResponsiveDisplayAdLongHeadline ;;
  }

  dimension: multi_asset_responsive_display_ad_main_color {
    type: string
    sql: ${TABLE}.MultiAssetResponsiveDisplayAdMainColor ;;
  }

  dimension: multi_asset_responsive_display_ad_marketing_images {
    type: string
    sql: ${TABLE}.MultiAssetResponsiveDisplayAdMarketingImages ;;
  }

  dimension: multi_asset_responsive_display_ad_square_marketing_images {
    type: string
    sql: ${TABLE}.MultiAssetResponsiveDisplayAdSquareMarketingImages ;;
  }

  dimension: multi_asset_responsive_display_ad_you_tube_videos {
    type: string
    sql: ${TABLE}.MultiAssetResponsiveDisplayAdYouTubeVideos ;;
  }

  dimension: path1 {
    type: string
    sql: ${TABLE}.Path1 ;;
  }

  dimension: path2 {
    type: string
    sql: ${TABLE}.Path2 ;;
  }

  dimension: policy_summary {
    type: string
    sql: ${TABLE}.PolicySummary ;;
  }

  dimension: price_prefix {
    type: string
    sql: ${TABLE}.PricePrefix ;;
  }

  dimension: promo_text {
    type: string
    sql: ${TABLE}.PromoText ;;
  }

  dimension: responsive_search_ad_descriptions {
    type: string
    sql: ${TABLE}.ResponsiveSearchAdDescriptions ;;
  }

  dimension: responsive_search_ad_headlines {
    type: string
    sql: ${TABLE}.ResponsiveSearchAdHeadlines ;;
  }

  dimension: responsive_search_ad_path1 {
    type: string
    sql: ${TABLE}.ResponsiveSearchAdPath1 ;;
  }

  dimension: responsive_search_ad_path2 {
    type: string
    sql: ${TABLE}.ResponsiveSearchAdPath2 ;;
  }

  dimension: short_headline {
    type: string
    sql: ${TABLE}.ShortHeadline ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: system_managed_entity_source {
    type: string
    sql: ${TABLE}.SystemManagedEntitySource ;;
  }

  dimension: trademarks {
    type: string
    sql: ${TABLE}.Trademarks ;;
  }

  dimension: universal_app_ad_descriptions {
    type: string
    sql: ${TABLE}.UniversalAppAdDescriptions ;;
  }

  dimension: universal_app_ad_headlines {
    type: string
    sql: ${TABLE}.UniversalAppAdHeadlines ;;
  }

  dimension: universal_app_ad_html5_media_bundles {
    type: string
    sql: ${TABLE}.UniversalAppAdHtml5MediaBundles ;;
  }

  dimension: universal_app_ad_images {
    type: string
    sql: ${TABLE}.UniversalAppAdImages ;;
  }

  dimension: universal_app_ad_mandatory_ad_text {
    type: string
    sql: ${TABLE}.UniversalAppAdMandatoryAdText ;;
  }

  dimension: universal_app_ad_you_tube_videos {
    type: string
    sql: ${TABLE}.UniversalAppAdYouTubeVideos ;;
  }



  measure: number_of_ads {
    description: "includes all statuses (PAUSED, ENABLED, DISABLED)"
    type: count
  }

  measure: number_of_enabled_ads {
    description: "includes only status (ENABLED)"
    filters: [status: "ENABLED"]
    type: count
  }

  drill_fields:   [campaign.campaign_name,ad_group.ad_group_name,description,display_url]
}
