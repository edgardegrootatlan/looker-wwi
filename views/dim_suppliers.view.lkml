# The name of this view in Looker is "Dim Suppliers"
view: dim_suppliers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `wide-world-importers-387612.analytics.dim_suppliers` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Bank Account Number" in Explore.

  dimension: bank_account_number {
    type: string
    sql: ${TABLE}.bank_account_number ;;
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

  dimension: is_supplier_category_valid {
    type: yesno
    sql: ${TABLE}.is_supplier_category_valid ;;
  }

  dimension: is_supplier_valid {
    type: yesno
    sql: ${TABLE}.is_supplier_valid ;;
  }

  dimension: payment_term_days {
    type: number
    sql: ${TABLE}.payment_term_days ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_payment_term_days {
    type: sum
    sql: ${payment_term_days} ;;  }
  measure: average_payment_term_days {
    type: average
    sql: ${payment_term_days} ;;  }

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

  dimension: supplier_category_id {
    type: number
    sql: ${TABLE}.supplier_category_id ;;
  }

  dimension: supplier_category_name {
    type: string
    sql: ${TABLE}.supplier_category_name ;;
  }

  dimension: supplier_id {
    type: number
    sql: ${TABLE}.supplier_id ;;
  }

  dimension: supplier_name {
    type: string
    sql: ${TABLE}.supplier_name ;;
  }

  dimension: supplier_reference {
    type: string
    sql: ${TABLE}.supplier_reference ;;
  }

  dimension: website_url {
    type: string
    sql: ${TABLE}.website_url ;;
  }
  measure: count {
    type: count
    drill_fields: [postal_city_name, delivery_city_name, delivery_method_name, supplier_category_name, supplier_name]
  }
}
