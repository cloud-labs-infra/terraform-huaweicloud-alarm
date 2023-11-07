resource "huaweicloud_lts_keywords_alarm_rule" "alarm" {
  name               = var.name
  alarm_level        = var.level
  send_notifications = var.send_notifications
  keywords_requests {
    keywords               = var.keywords_requests.keywords
    condition              = var.keywords_requests.condition
    number                 = var.keywords_requests.number
    log_group_id           = var.keywords_requests.log_group_id
    log_stream_id          = var.keywords_requests.log_stream_id
    search_time_range_unit = var.keywords_requests.search_time_range_unit
    search_time_range      = var.keywords_requests.search_time_range
  }
  frequency {
    type            = var.frequency.type
    fixed_rate_unit = var.frequency.fixed_rate_unit
    fixed_rate      = var.frequency.fixed_rate
  }
  notification_rule {
    template_name = var.notification_rule.template_name
    user_name     = var.notification_rule.user_name

    dynamic "topics" {
      for_each = toset(var.notification_rule.topics)
      content {
        name      = topics.value.name
        topic_urn = topics.value.topic_urn
      }
    }
  }
}