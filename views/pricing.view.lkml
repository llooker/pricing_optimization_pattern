view: pricing {
  derived_table: {
    sql: select product_id,
                array_agg(list_price_converged
                       order by fiscal_date desc limit 1)[offset(0)] as list_price,
                (-1*sum(fixed_production_costs_std + cash_discounts_and_other_sales_deductions + other_cost_of_sales +
                trade_budget_costs + variable_production_costs_std))/nullif(sum(Invoiced_quantity_in_Pieces),0)
                from ${cdm_pricing.SQL_TABLE_NAME} group by 1 ;;
  }

  parameter: percent_change_in_orders {
    description: "User entered increase or decrease in units ordered"
    type: number
    default_value: "-.1"
  }

  parameter: percent_change_in_price {
    description: "User entered increase or decrease in price"
    type: number
    default_value: ".25"
  }

  parameter: percent_change_in_costs {
    description: "Usered entered change in costs"
    type: number
    default_value: "0"
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: current_price {
    type: number
    sql: ${TABLE}.current_price ;;
  }

  dimension: listed_price {
    type: number
    sql: -${current_price}*{% parameter percent_change_in_price %} + ${current_price};;
  }

  dimension: average_costs_per_unit {
    type: number
    sql: ${TABLE}.average_costs_per_unit ;;
  }

  dimension: estimated_costs_per_unit {
    type: number
    sql: -${average_costs_per_unit}*{% parameter percent_change_in_costs %} + ${average_costs_per_unit};;
  }

  dimension: estimated_units_sold {
    type: number
    sql: -${forecasting.forecast_value}*{% parameter percent_change_in_orders %} + ${forecasting.forecast_value};;
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
