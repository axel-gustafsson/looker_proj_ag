view: dailysesscount {
  derived_table: {
    sql: SELECT
        daily_sessions.date  AS daily_sessions_date,
        sum(daily_sessions.views) AS daily_sessions_count
      FROM test_usage_data.daily_sessions  AS daily_sessions

      GROUP BY 1
      ORDER BY 1 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: daily_sessions_date {
    type: string
    sql: ${TABLE}.daily_sessions_date ;;
  }

  dimension: daily_sessions_count {
    type: number
    sql: ${TABLE}.daily_sessions_count ;;
  }

  set: detail {
    fields: [daily_sessions_date, daily_sessions_count]
  }
}
