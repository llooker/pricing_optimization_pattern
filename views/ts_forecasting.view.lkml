view: arima_model {
  derived_table: {
    persist_for: "24 hours"
    sql_create:
      CREATE OR REPLACE MODEL ${SQL_TABLE_NAME}
            OPTIONS
              (model_type = 'ARIMA_PLUS',
               time_series_timestamp_col = 'fiscal_date',
               time_series_data_col = 'total_quantity',
               time_series_id_col = 'product_id',
               auto_arima = TRUE,
               data_frequency = 'AUTO_FREQUENCY',
               decompose_time_series = TRUE
              ) AS
            SELECT
              fiscal_date,
              product_id,
              SUM(invoiced_quantity_in_pieces) AS total_quantity
            FROM
              ${cdm_pricing.SQL_TABLE_NAME}
            GROUP BY 1,2 ;;
  }
}

view: forecasting {
  view_label: "Quantity Sold Forecasting"
  derived_table: {
    sql: SELECT * FROM ML.FORECAST(MODEL  ${arima_model.SQL_TABLE_NAME},
             STRUCT(30 AS horizon, 0.8 AS confidence_level)) ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: forecast_timestamp {
    type: time
    sql: ${TABLE}.forecast_timestamp  ;;
  }

  dimension: forecast_value {
    label: "Predicted Invoiced Quantity in Units "
    type: number
    sql: ${TABLE}.forecast_value  ;;
  }

  dimension: standard_error {
    type: number
    sql: ${TABLE}.standard_error  ;;
  }

  dimension: confidence_level {
    type: number
    sql: ${TABLE}.confidence_level  ;;
  }

  dimension: prediction_interval_lower_bound {
    type: number
    sql: ${TABLE}.prediction_interval_lower_bound  ;;
  }

  dimension: prediction_interval_upper_bound {
    type: number
    sql: ${TABLE}.prediction_interval_upper_bound  ;;
  }

  dimension: confidence_interval_lower_bound {
    type: number
    sql: ${TABLE}.confidence_interval_lower_bound  ;;
  }

  dimension: confidence_interval_upper_bound {
    type: number
    sql: ${TABLE}.confidence_interval_upper_bound  ;;
  }

  measure: total_forecasted_quantity {
    type: sum
    sql: ${forecast_value} ;;
  }

  measure: average_standard_error {
    type: average
    sql: ${standard_error} ;;
  }

  measure: average_prediction_interval_lower {
    type: average
    sql: ${prediction_interval_lower_bound} ;;
  }

  measure: average_prediction_interval_upper {
    type: average
    sql: ${prediction_interval_upper_bound} ;;
  }

  measure: average_confidence_level {
    type: average
    sql:${confidence_level} ;;
  }

  measure: average_confidence_interval_lower {
    type: average
    sql:${confidence_interval_lower_bound} ;;
  }

  measure: average_confidence_interval_upper {
    type: average
    sql:${confidence_interval_upper_bound} ;;
  }
}
