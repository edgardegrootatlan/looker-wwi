# The name of this view in Looker is "Dim Stock Items"
view: dim_stock_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `wide-world-importers-387612.analytics.dim_stock_items` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Barcode" in Explore.

  dimension: barcode {
    type: string
    sql: ${TABLE}.barcode ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: color_id {
    type: number
    sql: ${TABLE}.color_id ;;
  }

  dimension: color_name {
    type: string
    sql: ${TABLE}.color_name ;;
  }

  dimension: is_chiller_stock {
    type: string
    sql: ${TABLE}.is_chiller_stock ;;
  }

  dimension: is_stock_item_valid {
    type: yesno
    sql: ${TABLE}.is_stock_item_valid ;;
  }

  dimension: item_size {
    type: string
    sql: ${TABLE}.item_size ;;
  }

  dimension: outer_package_type_name {
    type: string
    sql: ${TABLE}.outer_package_type_name ;;
  }

  dimension: quantity_per_outer {
    type: number
    sql: ${TABLE}.quantity_per_outer ;;
  }

  dimension: replenishment_lead_time_days {
    type: number
    sql: ${TABLE}.replenishment_lead_time_days ;;
  }

  dimension: stock_item_id {
    type: number
    sql: ${TABLE}.stock_item_id ;;
  }

  dimension: stock_item_name {
    type: string
    sql: ${TABLE}.stock_item_name ;;
  }

  dimension: supplier_id {
    type: number
    sql: ${TABLE}.supplier_id ;;
  }

  dimension: supplier_name {
    type: string
    sql: ${TABLE}.supplier_name ;;
  }

  dimension: tax_rate {
    type: number
    sql: ${TABLE}.tax_rate ;;
  }

  dimension: unit_package_type_name {
    type: string
    sql: ${TABLE}.unit_package_type_name ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_unit_price {
    type: sum
    sql: ${unit_price} ;;  }
  measure: average_unit_price {
    type: average
    sql: ${unit_price} ;;  }
  measure: count {
    type: count
    drill_fields: [stock_item_name, outer_package_type_name, color_name, unit_package_type_name, supplier_name]
  }
}
