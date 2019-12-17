view: daily_sessions {
  sql_table_name: test_usage_data.daily_sessions ;;

  dimension: dashboard {
    type: string
    sql: ${TABLE}.dashboard ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}.user ;;
  }

  dimension: views {
    type: number
    sql: ${TABLE}.views ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
