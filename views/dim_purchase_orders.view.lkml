# The name of this view in Looker is "Dim Purchase Orders"
view: dim_purchase_orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `wide-world-importers-387612.analytics.dim_purchase_orders` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Contact Person ID" in Explore.

  dimension: contact_person_id {
    type: number
    sql: ${TABLE}.contact_person_id ;;
  }

  dimension: contact_person_name {
    type: string
    sql: ${TABLE}.contact_person_name ;;
  }

  dimension: delivery_method_id {
    type: number
    sql: ${TABLE}.delivery_method_id ;;
  }

  dimension: delivery_method_name {
    type: string
    sql: ${TABLE}.delivery_method_name ;;
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

  dimension: purchase_order_id {
    type: number
    sql: ${TABLE}.purchase_order_id ;;
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
  measure: count {
    type: count
    drill_fields: [delivery_method_name, contact_person_name, supplier_name]
  }
}
