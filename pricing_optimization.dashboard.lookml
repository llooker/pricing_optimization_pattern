- dashboard: pricing_optimization
  title: Pricing Optimization
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: Pricing Optimization
    type: text
    title_text: Pricing Optimization
    subtitle_text: 'Overview of sales margins broken down by costs and discounts '
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Breakdown by Customer Hierarchy
    name: Breakdown by Customer Hierarchy
    model: pricing_optimization
    explore: cdm_pricing
    type: looker_column
    fields: [cdm_pricing.customer_hierarchy, cdm_pricing.total_gross_margin, cdm_pricing.total_gross_sales]
    sorts: [cdm_pricing.total_gross_sales desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: cdm_pricing.total_gross_margin,
            id: cdm_pricing.total_gross_margin, name: Total Gross Margin}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: cdm_pricing.total_gross_sales,
            id: cdm_pricing.total_gross_sales, name: Total Gross Sales}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      cdm_pricing.total_gross_margin: line
    defaults_version: 1
    listen: {}
    row: 7
    col: 0
    width: 12
    height: 6
  - title: Profit Breakdown
    name: Profit Breakdown
    model: pricing_optimization
    explore: cdm_pricing
    type: looker_column
    fields: [cdm_pricing.total_gross_sales, cdm_pricing.total_variable_production_costs_std,
      cdm_pricing.total_fixed_production_costs_std, cdm_pricing.total_net_sales]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
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
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: cdm_pricing.total_gross_sales,
            id: cdm_pricing.total_gross_sales, name: Total Gross Sales}, {axisId: cdm_pricing.total_variable_production_costs_std,
            id: cdm_pricing.total_variable_production_costs_std, name: Total Variable
              Production Costs Std}, {axisId: cdm_pricing.total_fixed_production_costs_std,
            id: cdm_pricing.total_fixed_production_costs_std, name: Total Fixed Production
              Costs Std}, {axisId: cdm_pricing.total_net_sales, id: cdm_pricing.total_net_sales,
            name: Total Net Sales}], showLabels: true, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors:
      cdm_pricing.total_variable_production_costs_std: "#E8710A"
      cdm_pricing.total_fixed_production_costs_std: "#E8710A"
      cdm_pricing.total_net_sales: "#1A73E8"
      cdm_pricing.total_other_cost_of_sales: "#E8710A"
      cdm_pricing.total_cash_discounts_and_other_sales_deductions: "#F9AB00"
    defaults_version: 1
    listen: {}
    row: 7
    col: 12
    width: 12
    height: 6
  - title: Gross Margin this Quarter
    name: Gross Margin this Quarter
    model: pricing_optimization
    explore: cdm_pricing
    type: single_value
    fields: [cdm_pricing.total_gross_margin, cdm_pricing.fiscal_quarter]
    fill_fields: [cdm_pricing.fiscal_quarter]
    sorts: [cdm_pricing.fiscal_quarter desc]
    limit: 1
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 3
    col: 0
    width: 4
    height: 4
  - name: Impact of Historical Pricing Changes
    type: text
    title_text: Impact of Historical Pricing Changes
    subtitle_text: How have past changes to list price impacted sales
    body_text: ''
    row: 13
    col: 0
    width: 24
    height: 4
  - name: Predicted Impact of Future Pricing Changes
    type: text
    title_text: Predicted Impact of Future Pricing Changes
    subtitle_text: Use the filters at the top of the dashboard to simulate different
      scenarios
    body_text: ''
    row: 25
    col: 0
    width: 24
    height: 3
  - title: Average List Price this Quarter
    name: Average List Price this Quarter
    model: pricing_optimization
    explore: cdm_pricing
    type: single_value
    fields: [cdm_pricing.average_list_price, cdm_pricing.fiscal_quarter]
    fill_fields: [cdm_pricing.fiscal_quarter]
    sorts: [cdm_pricing.fiscal_quarter desc]
    limit: 2
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: "% Change", expression: "${cdm_pricing.average_list_price}-offset(${cdm_pricing.average_list_price},1)",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [cdm_pricing.fiscal_quarter]
    listen: {}
    row: 3
    col: 4
    width: 4
    height: 4
  - title: Sales this Quarter
    name: Sales this Quarter
    model: pricing_optimization
    explore: cdm_pricing
    type: single_value
    fields: [cdm_pricing.fiscal_quarter, cdm_pricing.total_net_sales]
    fill_fields: [cdm_pricing.fiscal_quarter]
    sorts: [cdm_pricing.fiscal_quarter desc]
    limit: 2
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: "% Change", expression: "(${cdm_pricing.total_net_sales}-offset(${cdm_pricing.total_net_sales},1))/offset(${cdm_pricing.total_net_sales},1)",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: $#.00,, "M"
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [cdm_pricing.fiscal_quarter]
    listen: {}
    row: 3
    col: 8
    width: 4
    height: 4
  - title: Percent Price Change vs Order Change
    name: Percent Price Change vs Order Change
    model: pricing_optimization
    explore: price_changes
    type: looker_scatter
    fields: [price_changes.percent_ordered_change, price_changes.percent_price_change]
    sorts: [price_changes.percent_price_change]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    defaults_version: 1
    listen: {}
    row: 17
    col: 5
    width: 11
    height: 8
  - title: Average Historical Price Change
    name: Average Historical Price Change
    model: pricing_optimization
    explore: price_changes
    type: single_value
    fields: [price_changes.average_price_change]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 17
    col: 0
    width: 5
    height: 4
  - title: Average Days Between Price Change
    name: Average Days Between Price Change
    model: pricing_optimization
    explore: price_changes
    type: single_value
    fields: [price_changes.average_days_to_price_change]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 21
    col: 0
    width: 5
    height: 4
  - title: Price Change Bucket vs Change in Order Quantity
    name: Price Change Bucket vs Change in Order Quantity
    model: pricing_optimization
    explore: price_changes
    type: looker_column
    fields: [price_changes.percent_price_change_bucket, price_changes.average_order_change]
    filters:
      price_changes.percent_price_change_bucket: "-Undefined"
    sorts: [price_changes.percent_price_change_bucket]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      price_changes.average_order_change: "#E8710A"
    series_labels:
      "[-1.0,-0.5) - 02 - price_changes.average_order_change": Decrease Price 50-100%
    defaults_version: 1
    listen: {}
    row: 17
    col: 16
    width: 8
    height: 8
  - title: Cost Trends
    name: Cost Trends
    model: pricing_optimization
    explore: cdm_pricing
    type: looker_area
    fields: [cdm_pricing.total_cost_by_unit, cdm_pricing.fiscal_week]
    filters:
      cdm_pricing.total_cost_by_unit: "-NULL"
    sorts: [cdm_pricing.fiscal_week desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      cdm_pricing.total_cost_by_unit: "#12B5CB"
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: string, label: Trend in cost
          per unit}]
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 3
    col: 12
    width: 12
    height: 4
  - title: Forecasted Quantity Sold (w/o pricing change)
    name: Forecasted Quantity Sold (w/o pricing change)
    model: pricing_optimization
    explore: forecasting
    type: looker_area
    fields: [forecasting.forecast_timestamp_date, forecasting.total_forecasted_quantity]
    filters:
      forecasting.forecast_timestamp_date: 2015/04/01 to 2015/12/01
    sorts: [forecasting.forecast_timestamp_date desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      Price Multiplier: pricing.percent_change_in_price
    row: 38
    col: 0
    width: 24
    height: 6
  - title: With Price Change
    name: With Price Change
    model: pricing_optimization
    explore: forecasting
    type: single_value
    fields: [pricing.total_predicted_net_revenue, forecasting.forecast_timestamp_month]
    filters:
      forecasting.forecast_timestamp_year: '2015'
      forecasting.forecast_timestamp_month: 2015-12
    sorts: [forecasting.forecast_timestamp_month desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Cost Multiplier: pricing.percent_change_in_costs
      Order Multiplier: pricing.percent_change_in_orders
      Price Multiplier: pricing.percent_change_in_price
    row: 30
    col: 1
    width: 5
    height: 3
  - title: Without Price Change
    name: Without Price Change
    model: pricing_optimization
    explore: forecasting
    type: single_value
    fields: [pricing.total_predicted_net_revenue, forecasting.forecast_timestamp_month]
    filters:
      forecasting.forecast_timestamp_year: '2015'
      forecasting.forecast_timestamp_month: 2015-12
    sorts: [forecasting.forecast_timestamp_month desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 30
    col: 6
    width: 5
    height: 3
  - name: ''
    type: text
    title_text: ''
    subtitle_text: Estimated Quantity Sold for Next Month
    body_text: ''
    row: 33
    col: 0
    width: 12
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: Estimated Net Revenue for Next Month
    body_text: ''
    row: 28
    col: 0
    width: 12
    height: 2
  - title: 'With Price Change '
    name: 'With Price Change '
    model: pricing_optimization
    explore: forecasting
    type: single_value
    fields: [forecasting.forecast_timestamp_month, pricing.total_estimated_units_sold]
    filters:
      forecasting.forecast_timestamp_year: '2015'
      forecasting.forecast_timestamp_month: 2015-12
    sorts: [forecasting.forecast_timestamp_month desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Cost Multiplier: pricing.percent_change_in_costs
      Order Multiplier: pricing.percent_change_in_orders
      Price Multiplier: pricing.percent_change_in_price
    row: 35
    col: 1
    width: 5
    height: 3
  - title: Without Price Change
    name: Without Price Change (2)
    model: pricing_optimization
    explore: forecasting
    type: single_value
    fields: [forecasting.forecast_timestamp_month, pricing.total_estimated_units_sold]
    filters:
      forecasting.forecast_timestamp_year: '2015'
      forecasting.forecast_timestamp_month: 2015-12
    sorts: [forecasting.forecast_timestamp_month desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 35
    col: 6
    width: 5
    height: 3
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: Average Price per Unit
    body_text: ''
    row: 28
    col: 12
    width: 12
    height: 2
  - title: With Price Change
    name: With Price Change (2)
    model: pricing_optimization
    explore: forecasting
    type: single_value
    fields: [forecasting.forecast_timestamp_month, pricing.average_price_per_unit]
    filters:
      forecasting.forecast_timestamp_year: '2015'
      forecasting.forecast_timestamp_month: 2015-12
    sorts: [forecasting.forecast_timestamp_month desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Cost Multiplier: pricing.percent_change_in_costs
      Order Multiplier: pricing.percent_change_in_orders
      Price Multiplier: pricing.percent_change_in_price
    row: 30
    col: 13
    width: 5
    height: 3
  - title: 'Without Price Change '
    name: 'Without Price Change '
    model: pricing_optimization
    explore: forecasting
    type: single_value
    fields: [forecasting.forecast_timestamp_month, pricing.average_price_per_unit]
    filters:
      forecasting.forecast_timestamp_year: '2015'
      forecasting.forecast_timestamp_month: 2015-12
    sorts: [forecasting.forecast_timestamp_month desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 30
    col: 18
    width: 5
    height: 3
  - title: 'With Price Change '
    name: With Price Change  (2)
    model: pricing_optimization
    explore: forecasting
    type: single_value
    fields: [forecasting.forecast_timestamp_month, pricing.average_estimated_cost_per_unit]
    filters:
      forecasting.forecast_timestamp_year: '2015'
      forecasting.forecast_timestamp_month: 2015-12
    sorts: [forecasting.forecast_timestamp_month desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Cost Multiplier: pricing.percent_change_in_costs
      Order Multiplier: pricing.percent_change_in_orders
      Price Multiplier: pricing.percent_change_in_price
    row: 35
    col: 13
    width: 5
    height: 3
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: Average Cost per Unit
    body_text: ''
    row: 33
    col: 12
    width: 12
    height: 2
  - title: Without Price Change
    name: Without Price Change (3)
    model: pricing_optimization
    explore: forecasting
    type: single_value
    fields: [forecasting.forecast_timestamp_month, pricing.average_estimated_cost_per_unit]
    filters:
      forecasting.forecast_timestamp_year: '2015'
      forecasting.forecast_timestamp_month: 2015-12
    sorts: [forecasting.forecast_timestamp_month desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 35
    col: 18
    width: 5
    height: 3
  filters:
  - name: Cost Multiplier
    title: Cost Multiplier
    type: field_filter
    default_value: '1'
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: popover
      options:
      - ".5"
      - '75'
      - '1'
      - '1.25'
      - '1.5'
      - '1.75'
      - '2'
    model: pricing_optimization
    explore: forecasting
    listens_to_filters: []
    field: pricing.percent_change_in_costs
  - name: Order Multiplier
    title: Order Multiplier
    type: field_filter
    default_value: '1'
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: popover
      options:
      - ".5"
      - ".75"
      - '1'
      - '1.25'
      - '1.5'
      - '1.75'
      - '2'
    model: pricing_optimization
    explore: forecasting
    listens_to_filters: []
    field: pricing.percent_change_in_orders
  - name: Price Multiplier
    title: Price Multiplier
    type: field_filter
    default_value: '1'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
      options:
      - ".5"
      - ".75"
      - '1'
      - '1.25'
      - '1.5'
      - '1.75'
      - '2'
    model: pricing_optimization
    explore: forecasting
    listens_to_filters: []
    field: pricing.percent_change_in_price
