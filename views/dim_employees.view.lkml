# The name of this view in Looker is "Dim Employees"
view: dim_employees {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `wide-world-importers-387612.analytics.dim_employees` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Email Address" in Explore.

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: employee_id {
    type: number
    sql: ${TABLE}.employee_id ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: is_employee_valid {
    type: yesno
    sql: ${TABLE}.is_employee_valid ;;
  }

  dimension: is_sales_person {
    type: string
    sql: ${TABLE}.is_sales_person ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: preferred_name {
    type: string
    sql: ${TABLE}.preferred_name ;;
  }
  measure: count {
    type: count
    drill_fields: [full_name, preferred_name]
  }
}
