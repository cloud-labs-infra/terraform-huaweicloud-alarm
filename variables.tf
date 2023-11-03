variable "name" {
  description = "Specifies the name of the keywords alarm rule"
  type        = string
}

variable "send_notifications" {
  description = "Specifies whether to send notifications"
  type        = bool
  default     = "true"
}

variable "level" {
  description = "Specifies the alarm level"
  type        = string
  default     = "INFO"
  validation {
    condition     = contains(["INFO", "MINOR", "MAJOR", "CRITICAL"], var.level)
    error_message = "Alarm level is not one of: INFO, MINOR, MAJOR, CRITICAL"
  }
}

variable "keywords_requests" {
  description = "Specifies the keywords requests"
  type = object({
    keywords               = string
    condition              = string
    number                 = number
    log_group_id           = string
    log_stream_id          = string
    search_time_range_unit = string
    search_time_range      = number
  })
  validation {
    condition     = contains([">=", "<=", "<", ">"], var.keywords_requests.condition)
    error_message = "Keyword condition is not one of: >=, <=, <, >"
  }
  validation {
    condition     = contains(["minute", "hour"], var.keywords_requests.search_time_range_unit)
    error_message = "Search time range unit is not one of: minute, hour"
  }
}

variable "frequency" {
  description = "Specifies the alarm frequency configurations"
  type = object({
    type            = string
    fixed_rate_unit = string
    fixed_rate      = number
  })
  validation {
    condition     = contains(["CRON", "HOURLY", "DAILY", "WEEKLY", "FIXED_RATE"], var.frequency.type)
    error_message = "Frequency type is not one of: CRON, HOURLY, DAILY, WEEKLY, FIXED_RATE"
  }
}

variable "notification_rule" {
  description = "Specifies the notification rule"
  type = object({
    template_name = string
    user_name     = string
    topics = list(object({
      name      = string
      topic_urn = string
    }))
  })
}
