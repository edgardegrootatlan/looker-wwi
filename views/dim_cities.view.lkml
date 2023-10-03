# The name of this view in Looker is "Dim Cities"
view: dim_cities {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `wide-world-importers-387612.analytics.dim_cities` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "City ID" in Explore.

  dimension: city_id {
    type: number
    sql: ${TABLE}.city_id ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: city_validity {
    type: yesno
    sql: ${TABLE}.city_validity ;;
  }

  dimension: continent {
    type: string
    sql: ${TABLE}.continent ;;
  }

  dimension: country_formal_name {
    type: string
    sql: ${TABLE}.country_formal_name ;;
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: country_validity {
    type: yesno
    sql: ${TABLE}.country_validity ;;
  }

  dimension: iso_numeric_code {
    type: number
    sql: ${TABLE}.iso_numeric_code ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_iso_numeric_code {
    type: sum
    sql: ${iso_numeric_code} ;;  }
  measure: average_iso_numeric_code {
    type: average
    sql: ${iso_numeric_code} ;;  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: sales_territory {
    type: string
    sql: ${TABLE}.sales_territory ;;
  }

  dimension: state_province_code {
    type: string
    sql: ${TABLE}.state_province_code ;;
  }

  dimension: state_province_id {
    type: number
    sql: ${TABLE}.state_province_id ;;
  }

  dimension: state_province_name {
    type: string
    sql: ${TABLE}.state_province_name ;;
  }

  dimension: state_province_validity {
    type: yesno
    sql: ${TABLE}.state_province_validity ;;
  }

  dimension: sub_region {
    type: string
    sql: ${TABLE}.sub_region ;;
  }
  measure: count {
    type: count
    drill_fields: [state_province_name, city_name, country_formal_name, country_name]
  }
}
