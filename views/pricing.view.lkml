view: pricing {
  drill_fields: [product_id, average_estimated_cost_per_unit, average_price_per_unit, total_estimated_units_sold,total_predicted_costs,total_predicted_gross_revenue,total_predicted_net_revenue ]
  derived_table: {
    sql: select product_id,
                array_agg(list_price_converged
                       order by fiscal_date desc limit 1)[offset(0)] as current_price,
                (-1*sum(ifnull(fixed_production_costs_std,0) + ifnull(cash_discounts_and_other_sales_deductions,0) +
                ifnull(other_cost_of_sales,0) +
                ifnull(trade_budget_costs,0) +
                ifnull(variable_production_costs_std,0)))/nullif(sum(Invoiced_quantity_in_Pieces),0) as average_costs_per_unit
                from ${cdm_pricing.SQL_TABLE_NAME} group by 1 ;;
  }

  parameter: percent_change_in_orders {
    description: "User entered increase or decrease in units ordered"
    type: number
    default_value: "1"
  }

  parameter: percent_change_in_price {
    description: "User entered increase or decrease in price"
    type: number
    default_value: "1"
  }

  parameter: percent_change_in_costs {
    description: "Usered entered change in costs"
    type: number
    default_value: "1"
  }

  dimension: product_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: current_price {
    type: number
    sql: ${TABLE}.current_price ;;
  }

  dimension: listed_price {
    type: number
    sql: ${current_price}*{% parameter percent_change_in_price %};;
  }

  dimension: average_costs_per_unit {
    type: number
    sql: ${TABLE}.average_costs_per_unit ;;
  }

  dimension: estimated_costs_per_unit {
    type: number
    sql: ${average_costs_per_unit}*{% parameter percent_change_in_costs %};;
  }

  dimension: estimated_units_sold {
    type: number
    sql: ${forecasting.forecast_value}*{% parameter percent_change_in_orders %};;
  }

  measure: average_price_per_unit {
    value_format_name: usd
    type: average
    sql: ${listed_price} ;;
  }

  measure: average_estimated_cost_per_unit {
    value_format_name: usd
    type: average
    sql: ${estimated_costs_per_unit} ;;
  }

  measure: total_estimated_units_sold {
    value_format_name: decimal_2
    type: sum
    sql: ${estimated_units_sold} ;;
  }

  measure: total_predicted_gross_revenue {
    value_format_name: usd
    type: sum
    sql: ${estimated_units_sold}*${listed_price} ;;
  }

  measure: total_predicted_costs {
    value_format_name: usd
    type: sum
    sql: ${estimated_costs_per_unit}*${estimated_units_sold} ;;
  }

  measure: total_predicted_net_revenue {
    value_format_name: usd
    type: number
    sql: ${total_predicted_gross_revenue}-${total_predicted_costs} ;;
  }

}
