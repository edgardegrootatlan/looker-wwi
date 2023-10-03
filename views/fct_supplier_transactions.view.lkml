# The name of this view in Looker is "Fct Supplier Transactions"
view: fct_supplier_transactions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `wide-world-importers-387612.analytics.fct_supplier_transactions` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Amount Excluding Tax" in Explore.

  dimension: amount_excluding_tax {
    type: number
    sql: ${TABLE}.amount_excluding_tax ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amount_excluding_tax {
    type: sum
    sql: ${amount_excluding_tax} ;;  }
  measure: average_amount_excluding_tax {
    type: average
    sql: ${amount_excluding_tax} ;;  }

  dimension: is_finalized {
    type: string
    sql: ${TABLE}.is_finalized ;;
  }

  dimension: outstanding_balance {
    type: number
    sql: ${TABLE}.outstanding_balance ;;
  }

  dimension: payment_method_id {
    type: number
    sql: ${TABLE}.payment_method_id ;;
  }

  dimension: payment_method_name {
    type: string
    sql: ${TABLE}.payment_method_name ;;
  }

  dimension: purchase_order_id {
    type: number
    sql: ${TABLE}.purchase_order_id ;;
  }

  dimension: supplier_id {
    type: number
    sql: ${TABLE}.supplier_id ;;
  }

  dimension: supplier_invoice_number {
    type: string
    sql: ${TABLE}.supplier_invoice_number ;;
  }

  dimension: supplier_name {
    type: string
    sql: ${TABLE}.supplier_name ;;
  }

  dimension: supplier_transaction_id {
    type: number
    sql: ${TABLE}.supplier_transaction_id ;;
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
  }

  dimension: transaction_amount {
    type: number
    sql: ${TABLE}.transaction_amount ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: transaction {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.transaction_date ;;
  }

  dimension_group: transaction_finalization {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.transaction_finalization_date ;;
  }

  dimension: transaction_type_id {
    type: number
    sql: ${TABLE}.transaction_type_id ;;
  }
  measure: count {
    type: count
    drill_fields: [payment_method_name, supplier_name]
  }
}
