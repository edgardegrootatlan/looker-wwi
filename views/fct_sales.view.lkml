# The name of this view in Looker is "Fct Sales"
view: fct_sales {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `wide-world-importers-387612.analytics.fct_sales` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Accounts Person ID" in Explore.

  dimension: accounts_person_id {
    type: number
    sql: ${TABLE}.accounts_person_id ;;
  }

  dimension: accounts_person_name {
    type: string
    sql: ${TABLE}.accounts_person_name ;;
  }

  dimension: bill_to_customer_id {
    type: number
    sql: ${TABLE}.bill_to_customer_id ;;
  }

  dimension: bill_to_customer_name {
    type: string
    sql: ${TABLE}.bill_to_customer_name ;;
  }

  dimension: confirmed_delivery_time {
    type: string
    sql: ${TABLE}.confirmed_delivery_time ;;
  }

  dimension: confirmed_received_by {
    type: string
    sql: ${TABLE}.confirmed_received_by ;;
  }

  dimension: contact_person_id {
    type: number
    sql: ${TABLE}.contact_person_id ;;
  }

  dimension: contact_person_name {
    type: string
    sql: ${TABLE}.contact_person_name ;;
  }

  dimension: credit_note_reason {
    type: string
    sql: ${TABLE}.credit_note_reason ;;
  }

  dimension: customer_city_id {
    type: number
    sql: ${TABLE}.customer_city_id ;;
  }

  dimension: customer_city_name {
    type: string
    sql: ${TABLE}.customer_city_name ;;
  }

  dimension: customer_continent {
    type: string
    sql: ${TABLE}.customer_continent ;;
  }

  dimension: customer_country_id {
    type: number
    sql: ${TABLE}.customer_country_id ;;
  }

  dimension: customer_country_name {
    type: string
    sql: ${TABLE}.customer_country_name ;;
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

  dimension: customer_region {
    type: string
    sql: ${TABLE}.customer_region ;;
  }

  dimension: customer_state_province_code {
    type: string
    sql: ${TABLE}.customer_state_province_code ;;
  }

  dimension: customer_state_province_id {
    type: number
    sql: ${TABLE}.customer_state_province_id ;;
  }

  dimension: customer_state_province_name {
    type: string
    sql: ${TABLE}.customer_state_province_name ;;
  }

  dimension: customer_sub_region {
    type: string
    sql: ${TABLE}.customer_sub_region ;;
  }

  dimension: delivery_instructions {
    type: string
    sql: ${TABLE}.delivery_instructions ;;
  }

  dimension: delivery_method_id {
    type: number
    sql: ${TABLE}.delivery_method_id ;;
  }

  dimension: delivery_method_name {
    type: string
    sql: ${TABLE}.delivery_method_name ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: extended_price {
    type: number
    sql: ${TABLE}.extended_price ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_extended_price {
    type: sum
    sql: ${extended_price} ;;  }
  measure: average_extended_price {
    type: average
    sql: ${extended_price} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: invoice {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.invoice_date ;;
  }

  dimension: invoice_id {
    type: number
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: invoice_line_id {
    type: number
    sql: ${TABLE}.invoice_line_id ;;
  }

  dimension: is_credit_note {
    type: string
    sql: ${TABLE}.is_credit_note ;;
  }

  dimension: net_profit {
    type: number
    sql: ${TABLE}.net_profit ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: package_type_id {
    type: number
    sql: ${TABLE}.package_type_id ;;
  }

  dimension: package_type_name {
    type: string
    sql: ${TABLE}.package_type_name ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: sales_territory {
    type: string
    sql: ${TABLE}.sales_territory ;;
  }

  dimension: stock_item_id {
    type: number
    sql: ${TABLE}.stock_item_id ;;
  }

  dimension: stock_item_name {
    type: string
    sql: ${TABLE}.stock_item_name ;;
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
  }

  dimension: tax_rate {
    type: number
    sql: ${TABLE}.tax_rate ;;
  }

  dimension: total_chiller_items {
    type: number
    sql: ${TABLE}.total_chiller_items ;;
  }

  dimension: total_dry_items {
    type: number
    sql: ${TABLE}.total_dry_items ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	stock_item_name,
	customer_state_province_name,
	package_type_name,
	customer_city_name,
	customer_country_name,
	delivery_method_name,
	contact_person_name,
	bill_to_customer_name,
	customer_name,
	accounts_person_name
	]
  }

}
