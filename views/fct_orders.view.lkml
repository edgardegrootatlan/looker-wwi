# The name of this view in Looker is "Fct Orders"
view: fct_orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `wide-world-importers-387612.analytics.fct_orders` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Brand" in Explore.

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: contact_person_id {
    type: number
    sql: ${TABLE}.contact_person_id ;;
  }

  dimension: contact_person_name {
    type: string
    sql: ${TABLE}.contact_person_name ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: customer_purchase_order_number {
    type: string
    sql: ${TABLE}.customer_purchase_order_number ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: expected_delivery {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.expected_delivery_date ;;
  }

  dimension_group: order {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
  }

  dimension: order_description {
    type: string
    sql: ${TABLE}.order_description ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_line_id {
    type: number
    sql: ${TABLE}.order_line_id ;;
  }

  dimension: package_type_id {
    type: number
    sql: ${TABLE}.package_type_id ;;
  }

  dimension: package_type_name {
    type: string
    sql: ${TABLE}.package_type_name ;;
  }

  dimension: picked_by_person_id {
    type: number
    sql: ${TABLE}.picked_by_person_id ;;
  }

  dimension: picked_by_person_name {
    type: string
    sql: ${TABLE}.picked_by_person_name ;;
  }

  dimension: picked_quantity {
    type: number
    sql: ${TABLE}.picked_quantity ;;
  }

  dimension_group: picking_completed_when {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.picking_completed_when ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: sales_person_person_id {
    type: number
    sql: ${TABLE}.sales_person_person_id ;;
  }

  dimension: sales_person_person_name {
    type: string
    sql: ${TABLE}.sales_person_person_name ;;
  }

  dimension: stock_item_id {
    type: number
    sql: ${TABLE}.stock_item_id ;;
  }

  dimension: stock_item_name {
    type: string
    sql: ${TABLE}.stock_item_name ;;
  }

  dimension: tax_rate {
    type: number
    sql: ${TABLE}.tax_rate ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	stock_item_name,
	package_type_name,
	sales_person_person_name,
	picked_by_person_name,
	customer_name,
	contact_person_name
	]
  }

}
