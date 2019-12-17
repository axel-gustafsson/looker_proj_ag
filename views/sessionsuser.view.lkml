view: sessionsuser {
  derived_table: {
    sql: SELECT
        daily_sessions.user  AS daily_sessions_user,
        COUNT(*) AS daily_sessions_count
      FROM test_usage_data.daily_sessions  AS daily_sessions
      where date = '2019-10-01'
      GROUP BY 1
      ORDER BY 2 DESC
      LIMIT 50
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: daily_sessions_user {
    type: string
    sql: ${TABLE}.daily_sessions_user ;;
  }

  dimension: daily_sessions_count {
    type: number
    sql: ${TABLE}.daily_sessions_count ;;
  }

  set: detail {
    fields: [daily_sessions_user, daily_sessions_count]
  }
}
