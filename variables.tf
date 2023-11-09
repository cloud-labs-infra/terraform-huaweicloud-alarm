variable "name" {
  description = "Specifies the name of the keywords alarm rule"
  type        = string
}

variable "name_postfix" {
  description = "Name Postfix"
  type        = string
  default     = null
}

variable "send_notifications" {
  description = "Specifies whether to send notifications"
  type        = bool
  default     = true
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
  description = <<DES
  Specifies the keywords requests:
  * `keywords` - Specifies the keywords
  * `condition` - Specifies the keywords request condition. The value can be: >=, <=, < and >
  * `number` - Specifies the line number
  * `log_group_id` - Specifies the log group id
  * `log_stream_id` - Specifies the log stream id
  * `search_time_range_unit` - Specifies the unit of search time range. The value can be: minute and hour
  * `search_time_range` - Specifies the search time range:
    * When the search_time_range_unit is minute, the value ranges from 1 to 60
    * When the search_time_range_unit is hour, the value ranges from 1 to 24
  DES

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
  description = <<DES
  Specifies the alarm frequency configurations:
  * `type` - Specifies the frequency type. The value can be: CRON, HOURLY, DAILY, WEEKLY and FIXED_RATE
  * `fixed_rate_unit` - Specifies the unit of search time range. The value can be: minute and hour
  * `fixed_rate` - This parameter is used when type is set to FIXED_RATE. Specifies the search time range:
    * When the fixed_rate_unit is minute, the value ranges from 1 to 60
    * When the fixed_rate_unit is hour, the value ranges from 1 to 24
  DES

  type = object({
    type            = string
    fixed_rate_unit = optional(string)
    fixed_rate      = optional(number)
  })
  validation {
    condition     = contains(["CRON", "HOURLY", "DAILY", "WEEKLY", "FIXED_RATE"], var.frequency.type)
    error_message = "Frequency type is not one of: CRON, HOURLY, DAILY, WEEKLY, FIXED_RATE"
  }
  default = {
    type            = "FIXED_RATE"
    fixed_rate_unit = "minute"
    fixed_rate      = 5
  }
}

variable "notification_rule" {
  description = <<DES
  Specifies the notification rule:
  * `template_name` - Specifies the notification template name
  * `user_name` - Specifies the user name
  * `topics` - Specifies the SMN topics:
    * 'name' - Specifies the topic name
    * 'topic_urn' - Specifies the topic URN
  DES

  type = object({
    template_name = string
    user_name     = string
    topics = list(object({
      name      = string
      topic_urn = string
    }))
  })
}
