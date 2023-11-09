# Huawei Cloud LTS Alarm
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4 |
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | ~>1.47 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | ~>1.47 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [huaweicloud_lts_keywords_alarm_rule.alarm](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/lts_keywords_alarm_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_frequency"></a> [frequency](#input\_frequency) | Specifies the alarm frequency configurations:<br>  * `type` - Specifies the frequency type. The value can be: CRON, HOURLY, DAILY, WEEKLY and FIXED\_RATE<br>  * `fixed_rate_unit` - Specifies the unit of search time range. The value can be: minute and hour<br>  * `fixed_rate` - This parameter is used when type is set to FIXED\_RATE. Specifies the search time range:<br>    * When the fixed\_rate\_unit is minute, the value ranges from 1 to 60<br>    * When the fixed\_rate\_unit is hour, the value ranges from 1 to 24 | <pre>object({<br>    type            = string<br>    fixed_rate_unit = optional(string)<br>    fixed_rate      = optional(number)<br>  })</pre> | <pre>{<br>  "fixed_rate": 5,<br>  "fixed_rate_unit": "minute",<br>  "type": "FIXED_RATE"<br>}</pre> | no |
| <a name="input_keywords_requests"></a> [keywords\_requests](#input\_keywords\_requests) | Specifies the keywords requests:<br>  * `keywords` - Specifies the keywords<br>  * `condition` - Specifies the keywords request condition. The value can be: >=, <=, < and ><br>  * `number` - Specifies the line number<br>  * `log_group_id` - Specifies the log group id<br>  * `log_stream_id` - Specifies the log stream id<br>  * `search_time_range_unit` - Specifies the unit of search time range. The value can be: minute and hour<br>  * `search_time_range` - Specifies the search time range:<br>    * When the search\_time\_range\_unit is minute, the value ranges from 1 to 60<br>    * When the search\_time\_range\_unit is hour, the value ranges from 1 to 24 | <pre>object({<br>    keywords               = string<br>    condition              = string<br>    number                 = number<br>    log_group_id           = string<br>    log_stream_id          = string<br>    search_time_range_unit = string<br>    search_time_range      = number<br>  })</pre> | n/a | yes |
| <a name="input_level"></a> [level](#input\_level) | Specifies the alarm level | `string` | `"INFO"` | no |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the keywords alarm rule | `string` | n/a | yes |
| <a name="input_name_postfix"></a> [name\_postfix](#input\_name\_postfix) | Name Postfix | `string` | `null` | no |
| <a name="input_notification_rule"></a> [notification\_rule](#input\_notification\_rule) | Specifies the notification rule:<br>  * `template_name` - Specifies the notification template name<br>  * `user_name` - Specifies the user name<br>  * `topics` - Specifies the SMN topics:<br>    * 'name' - Specifies the topic name<br>    * 'topic\_urn' - Specifies the topic URN | <pre>object({<br>    template_name = string<br>    user_name     = string<br>    topics        = list(object({<br>      name      = string<br>      topic_urn = string<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_send_notifications"></a> [send\_notifications](#input\_send\_notifications) | Specifies whether to send notifications | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->