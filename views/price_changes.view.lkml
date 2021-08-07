view: price_changes {
    derived_table: {
      sql: select
        product_id,
        list_price_converged,
        total_ordered_pieces,
        total_net_sales,
        first_price_date,
        lag(list_price_converged) over(partition by product_id order by first_price_date asc) as previous_list,
        lag(total_ordered_pieces) over(partition by product_id order by first_price_date asc) as previous_total_ordered_pieces,
        lag(total_net_sales) over(partition by product_id order by first_price_date asc) as previous_total_net_sales,
        lag(first_price_date) over(partition by product_id order by first_price_date asc) as previous_first_price_date
        from (
      select
         product_id,list_price_converged,sum(invoiced_quantity_in_pieces) as total_ordered_pieces, sum(net_sales) as total_net_sales, min(fiscal_date) as first_price_date
      from ${cdm_pricing.SQL_TABLE_NAME} AS cdm_pricing
      group by 1,2
      order by 1, 2 asc
      )
       ;;
    }

    measure: count {
      type: count
    }

    dimension: product_id {
      type: string
      sql: ${TABLE}.product_id ;;
    }

    dimension: list_price_converged {
      group_label: "Product Details"
      type: number
      sql: ${TABLE}.list_price_converged ;;
    }

    dimension: total_ordered_pieces {
      group_label: "Product Details"
      type: number
      sql: ${TABLE}.total_ordered_pieces ;;
    }

    dimension: total_net_sales {
      group_label: "Product Details"
      type: number
      sql: ${TABLE}.total_net_sales ;;
    }

    dimension_group: first_price_date {
      group_label: "Product Details"
      type: time
      datatype: datetime
      sql: ${TABLE}.first_price_date ;;
    }

    dimension: previous_list {
      group_label: "Priort Product Details"
      type: number
      sql: ${TABLE}.previous_list ;;
    }

    dimension: previous_total_ordered_pieces {
      group_label: "Priort Product Details"
      type: number
      sql: ${TABLE}.previous_total_ordered_pieces ;;
    }

    dimension: previous_total_net_sales {
      group_label: "Priort Product Details"
      type: number
      sql: ${TABLE}.previous_total_net_sales ;;
    }

    dimension_group: previous_first_price_date {
      group_label: "Priort Product Details"
      type: time
      datatype: datetime
      sql: ${TABLE}.previous_first_price_date ;;
    }

    dimension: percent_price_change {
      type: number
      value_format_name: percent_1
      sql: (${list_price_converged}-${previous_list})/nullif(${previous_list},0) ;;
    }

    dimension_group: price_change {
      type: duration
      sql_start: ${previous_first_price_date_raw} ;;
      sql_end: ${first_price_date_raw} ;;
    }


    dimension: percent_ordered_change {
      type: number
      value_format_name: percent_1
      sql: (${total_ordered_pieces}-${previous_total_ordered_pieces})/nullif(${previous_total_ordered_pieces},0) ;;
    }

    dimension: percent_price_change_bucket {
      type: tier
      sql: ${percent_price_change} ;;
      tiers: [-2,-1,-0.5, -0.25,-0.1,0.1,0.25,0.5,1,2]
      style: interval
    }

    dimension: percent_net_sales_change {
      type: number
      value_format_name: percent_1
      sql: (${total_net_sales}-${previous_total_net_sales})/nullif(${previous_total_net_sales},0) ;;
    }

    measure: average_price_change {
      type: average
      value_format_name: percent_1
      sql: ${percent_price_change} ;;
    }

    measure: average_days_to_price_change {
      value_format_name: decimal_1
      type: average
      sql: ${days_price_change} ;;
    }

    measure: average_order_change {
      value_format_name: percent_1
      type: average
      sql: ${percent_ordered_change} ;;
    }

    measure: average_sales_change {
      value_format_name: percent_1
      type: average
      sql: ${percent_net_sales_change} ;;
    }
  }
