# The name of this view in Looker is "Fct Stock Item Holdings"
view: fct_stock_item_holdings {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `wide-world-importers-387612.analytics.fct_stock_item_holdings` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Bin Location" in Explore.

  dimension: bin_location {
    type: string
    sql: ${TABLE}.bin_location ;;
  }

  dimension: last_stock_take_quantity {
    type: number
    sql: ${TABLE}.last_stock_take_quantity ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_last_stock_take_quantity {
    type: sum
    sql: ${last_stock_take_quantity} ;;  }
  measure: average_last_stock_take_quantity {
    type: average
    sql: ${last_stock_take_quantity} ;;  }

  dimension: quantity_on_hand {
    type: number
    sql: ${TABLE}.quantity_on_hand ;;
  }

  dimension: re_order_level {
    type: number
    sql: ${TABLE}.re_order_level ;;
  }

  dimension: stock_item_id {
    type: number
    sql: ${TABLE}.stock_item_id ;;
  }

  dimension: stock_item_name {
    type: string
    sql: ${TABLE}.stock_item_name ;;
  }

  dimension: target_stock_level {
    type: number
    sql: ${TABLE}.target_stock_level ;;
  }
  measure: count {
    type: count
    drill_fields: [stock_item_name]
  }
}
