# The name of this view in Looker is "Dim Customers"
view: dim_customers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `wide-world-importers-387612.analytics.dim_customers` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: account_opened {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.account_opened_date ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Buying Group ID" in Explore.

  dimension: buying_group_id {
    type: number
    sql: ${TABLE}.buying_group_id ;;
  }

  dimension: buying_group_name {
    type: string
    sql: ${TABLE}.buying_group_name ;;
  }

  dimension: customer_category_id {
    type: number
    sql: ${TABLE}.customer_category_id ;;
  }

  dimension: customer_category_name {
    type: string
    sql: ${TABLE}.customer_category_name ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }

  dimension: delivery_city_id {
    type: number
    sql: ${TABLE}.delivery_city_id ;;
  }

  dimension: delivery_city_name {
    type: string
    sql: ${TABLE}.delivery_city_name ;;
  }

  dimension: delivery_method_id {
    type: number
    sql: ${TABLE}.delivery_method_id ;;
  }

  dimension: delivery_method_name {
    type: string
    sql: ${TABLE}.delivery_method_name ;;
  }

  dimension: payment_days {
    type: number
    sql: ${TABLE}.payment_days ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_payment_days {
    type: sum
    sql: ${payment_days} ;;  }
  measure: average_payment_days {
    type: average
    sql: ${payment_days} ;;  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: postal_city_id {
    type: number
    sql: ${TABLE}.postal_city_id ;;
  }

  dimension: postal_city_name {
    type: string
    sql: ${TABLE}.postal_city_name ;;
  }

  dimension: website_url {
    type: string
    sql: ${TABLE}.website_url ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	postal_city_name,
	delivery_city_name,
	customer_category_name,
	delivery_method_name,
	customer_name,
	buying_group_name
	]
  }

}
