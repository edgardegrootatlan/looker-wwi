# The name of this view in Looker is "Dim Purchase Order Lines"
view: dim_purchase_order_lines {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `wide-world-importers-387612.analytics.dim_purchase_order_lines` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Expected Unit Price per Outer" in Explore.

  dimension: expected_unit_price_per_outer {
    type: number
    sql: ${TABLE}.expected_unit_price_per_outer ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_expected_unit_price_per_outer {
    type: sum
    sql: ${expected_unit_price_per_outer} ;;  }
  measure: average_expected_unit_price_per_outer {
    type: average
    sql: ${expected_unit_price_per_outer} ;;  }

  dimension: is_purchase_order_closed {
    type: string
    sql: ${TABLE}.is_purchase_order_closed ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_receipt {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_receipt_date ;;
  }

  dimension: order_line_description {
    type: string
    sql: ${TABLE}.order_line_description ;;
  }

  dimension: ordered_outers {
    type: number
    sql: ${TABLE}.ordered_outers ;;
  }

  dimension: package_type_id {
    type: number
    sql: ${TABLE}.package_type_id ;;
  }

  dimension: package_type_name {
    type: string
    sql: ${TABLE}.package_type_name ;;
  }

  dimension: purchase_order_id {
    type: number
    sql: ${TABLE}.purchase_order_id ;;
  }

  dimension: purchase_order_line_id {
    type: number
    sql: ${TABLE}.purchase_order_line_id ;;
  }

  dimension: received_outers {
    type: number
    sql: ${TABLE}.received_outers ;;
  }

  dimension: stock_item_id {
    type: number
    sql: ${TABLE}.stock_item_id ;;
  }

  dimension: stock_item_name {
    type: string
    sql: ${TABLE}.stock_item_name ;;
  }
  measure: count {
    type: count
    drill_fields: [stock_item_name, package_type_name]
  }
}
