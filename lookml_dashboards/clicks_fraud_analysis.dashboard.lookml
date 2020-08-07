- dashboard: clicks_fraud_analysis
  title: Clicks Fraud Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Account
    name: Account
    explore: ad_basic_stats
    type: looker_waterfall
    fields: [budget.account_descriptive_name, fact.total_clicks]
    filters:
      fact.date_period_latest: 'Yes'
    sorts: [fact.total_clicks desc]
    limit: 500
    up_color: "#4285F4"
    down_color: "#EA4335"
    total_color: "#FBBC04"
    show_value_labels: false
    show_x_axis_ticks: true
    show_x_axis_label: true
    x_axis_scale: auto
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Date: fact.date_date
    row: 9
    col: 0
    width: 9
    height: 6
  - title: Campaigns
    name: Campaigns
    explore: ad_basic_stats
    type: looker_waterfall
    fields: [fact.total_clicks, campaign.campaign_name]
    filters:
      fact.date_period_latest: 'Yes'
      fact.total_clicks: ">=0"
    sorts: [fact.total_clicks desc]
    limit: 500
    up_color: "#4285F4"
    down_color: "#EA4335"
    total_color: "#FBBC04"
    show_value_labels: false
    show_x_axis_ticks: true
    show_x_axis_label: true
    x_axis_scale: auto
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Date: fact.date_date
    row: 15
    col: 12
    width: 12
    height: 7
  - title: Ad Group
    name: Ad Group
    explore: ad_basic_stats
    type: looker_waterfall
    fields: [fact.total_clicks, ad_group.ad_group_name]
    filters:
      fact.date_period_latest: 'Yes'
      fact.total_clicks: ">0"
    sorts: [fact.total_clicks desc]
    limit: 500
    up_color: "#4285F4"
    down_color: "#EA4335"
    total_color: "#FBBC04"
    show_value_labels: false
    show_x_axis_ticks: true
    show_x_axis_label: true
    x_axis_scale: auto
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Date: fact.date_date
    row: 9
    col: 9
    width: 15
    height: 6
  - title: Top 10 Keywords
    name: Top 10 Keywords
    explore: ad_basic_stats
    type: looker_waterfall
    fields: [fact.total_clicks, keyword.criteria]
    filters:
      fact.date_period_latest: 'Yes'
      fact.total_clicks: ">0"
    sorts: [fact.total_clicks desc]
    limit: 10
    up_color: "#4285F4"
    down_color: "#EA4335"
    total_color: "#FBBC04"
    show_value_labels: false
    show_x_axis_ticks: true
    show_x_axis_label: true
    x_axis_scale: auto
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Date: fact.date_date
    row: 15
    col: 0
    width: 12
    height: 7
  - name: "<strong>Clicks Fraud Analysis</strong>"
    type: text
    title_text: "<strong>Clicks Fraud Analysis</strong>"
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Clicks Camparaison
    type: text
    title_text: Clicks Camparaison
    subtitle_text: ''
    body_text: "Comparison of Number of Clicks between : \nThe **analysis date**,\n\
      The **day before**,\nand **7 days before (same day last week)** <br>\n\n**Explore\
      \ from here** any of the visualisations to add more metrics"
    row: 2
    col: 0
    width: 9
    height: 5
  - name: Key Influencers
    type: text
    title_text: Key Influencers
    subtitle_text: Account, Ad Group, Top 10 Keywords and Campaign
    row: 7
    col: 0
    width: 24
    height: 2
  - title: Clicks Comparaison
    name: Clicks Comparaison
    explore: ad_basic_stats
    type: looker_bar
    fields: [fact.date_date, fact.total_clicks]
    filters:
      fact.date_period_latest: 'Yes'
    sorts: [fact.date_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: fact.total_clicks,
            id: fact.total_clicks, name: Clicks}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 60, type: linear}]
    series_types: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Comparaisons Dates: fact.date_date
    row: 2
    col: 9
    width: 15
    height: 5
  filters:
  - name: Date
    title: Date
    type: date_filter
    default_value: yesterday
    allow_multiple_values: true
    required: true
  - name: Comparaisons Dates
    title: Comparaisons Dates
    type: date_filter
    default_value: yesterday, 2 days ago, 7 days ago
    allow_multiple_values: true
    required: true
