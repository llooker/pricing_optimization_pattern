view: cdm_pricing {
  label: "Pricing Optimization"
  sql_table_name: `leigha-bq-dev.retail.CDM_Pricing` ;;

  dimension: cash_discounts_and_other_sales_deductions {
    type: number
    sql: ${TABLE}.Cash_Discounts_and_other_Sales_Deductions ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.Channel ;;
  }

  dimension: client_id {
    group_label: "Customer"
    type: number
    sql: ${TABLE}.Client_ID ;;
  }

  dimension: customer_code {
    group_label: "Customer"
    type: number
    sql: ${TABLE}.Customer_code ;;
  }

  dimension: customer_hierarchy {
    group_label: "Customer"
    type: string
    sql: ${TABLE}.Customer_Hierarchy ;;
  }

  dimension: customer_long_description {
    group_label: "Customer"
    type: string
    sql: ${TABLE}.Customer_Long_Description ;;
  }

  dimension: division {
    type: string
    sql: ${TABLE}.Division ;;
  }

  dimension_group: fiscal {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Fiscal_Date ;;
  }

  dimension: fixed_production_costs_std {
    group_label: "Costs"
    type: number
    sql: ${TABLE}.Fixed_Production_Costs_STD ;;
  }

  dimension: gross_margin_after_logistics {
    group_label: "Margin"
    type: number
    sql: ${TABLE}.Gross_Margin_After_Logistics ;;
  }

  dimension: gross_sales {
    group_label: "Sales"
    type: number
    sql: ${TABLE}.Gross_Sales ;;
  }

  dimension: invoiced_quantity_in_pieces {
    type: number
    sql: ${TABLE}.Invoiced_quantity_in_Pieces ;;
  }

  dimension: key_account_manager {
    group_label: "Key Account Manager"
    type: number
    sql: ${TABLE}.Key_Account_Manager ;;
  }

  dimension: key_account_manager_description {
    group_label: "Key Account Manager"
    type: string
    sql: ${TABLE}.Key_Account_Manager_Description ;;
  }

  dimension: list_price_converged {
    label: "List Price"
    type: number
    sql: ${TABLE}.List_Price_Converged ;;
  }


  dimension: market {
    type: string
    sql: ${TABLE}.Market ;;
  }

  dimension: net_sales {
    group_label: "Sales"
    type: number
    sql: ${TABLE}.Net_Sales ;;
  }

  dimension: other_cost_of_sales {
    group_label: "Costs"
    type: number
    sql: ${TABLE}.Other_Cost_of_Sales ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.Product_ID ;;
  }

  dimension: standard_gross_margin {
    group_label: "Margin"
    type: number
    sql: ${TABLE}.Standard_Gross_Margin ;;
  }

  dimension: struct {
    type: string
    sql: ${TABLE}.`Struct` ;;
  }

  dimension: trade_budget_costs {
    group_label: "Costs"
    type: number
    sql: ${TABLE}.Trade_Budget_Costs ;;
  }

  dimension: transportation_std {
    type: number
    sql: ${TABLE}.Transportation_STD ;;
  }

  dimension: variable_production_costs_std {
    group_label: "Costs"
    type: number
    sql: ${TABLE}.Variable_Production_Costs_STD ;;
  }

  dimension: warehouse_std {
    type: number
    sql: ${TABLE}.Warehouse_STD ;;
  }

  measure: count {
    label: "Number of transactions"
    type: count
    drill_fields: []
  }

  measure: total_gross_sales {
    value_format_name: usd
    type: sum
    sql: ${gross_sales} ;;
  }

  measure: total_net_sales {
    value_format_name: usd
    type: number
    sql: ${total_gross_sales}+${total_fixed_production_costs_std}+${total_cash_discounts_and_other_sales_deductions}+
    ${total_other_cost_of_sales}+${total_trade_budget_costs}+${total_variable_production_costs_std};;
  }

  measure: total_cash_discounts_and_other_sales_deductions {
    value_format_name: usd
    type: sum
    sql:  ${cash_discounts_and_other_sales_deductions};;
  }

  measure: total_fixed_production_costs_std {
    value_format_name: usd
    type: sum
    sql: ${fixed_production_costs_std} ;;
  }

  measure: total_invoiced_quantity_in_pieces {
    type: sum
    sql:${invoiced_quantity_in_pieces} ;;
  }

  measure: total_other_cost_of_sales {
    value_format_name: usd
    type: sum
    sql:${other_cost_of_sales} ;;
  }

  measure: total_trade_budget_costs {
    value_format_name: usd
    type: sum
    sql:${trade_budget_costs} ;;
  }

  measure: total_variable_production_costs_std {
    value_format_name: usd
    type: sum
    sql:${variable_production_costs_std} ;;
  }

  measure: average_list_price {
    value_format_name: usd
    type: average
    sql: ${list_price_converged};;
  }

  measure: average_gross_margin_after_logistics {
    value_format_name: percent_1
    type: average
    sql: ${gross_margin_after_logistics};;
  }

  measure: average_standard_gross_margin {
    value_format_name: percent_1
    type: average
    sql: ${standard_gross_margin};;
  }

  measure: total_gross_margin {
    type: number
    value_format_name: percent_1
    sql: 1.0*(${total_net_sales})/nullif(${total_gross_sales},0) ;;
  }
}
