connection: "leigha-bq-dev"

# include all the views
include: "/views/**/*.view"

datagroup: pricing_optimization_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: pricing_optimization_default_datagroup

explore: cdm_pricing {
  label: "Pricing Optimization"
}

explore: price_changes {
  label: "Price Changes"
}

explore: forecasting {
  join: pricing {
    relationship: many_to_one
    sql_on: ${forecasting.product_id} = ${pricing.product_id} ;;
  }
}
