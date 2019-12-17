view: dailysessions {
  derived_table: {
    sql: select date, sum(views)
      from daily_sessions
      group by date
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: f0_ {
    type: number
    sql: ${TABLE}.f0_ ;;
  }

  set: detail {
    fields: [date, f0_]
  }
}
