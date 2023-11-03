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
| <a name="input_frequency"></a> [frequency](#input\_frequency) | Specifies the alarm frequency configurations | <pre>object({<br>    type            = string<br>    fixed_rate_unit = string<br>    fixed_rate      = number<br>  })</pre> | n/a | yes |
| <a name="input_keywords_requests"></a> [keywords\_requests](#input\_keywords\_requests) | Specifies the keywords requests | <pre>object({<br>    keywords               = string<br>    condition              = string<br>    number                 = number<br>    log_group_id           = string<br>    log_stream_id          = string<br>    search_time_range_unit = string<br>    search_time_range      = number<br>  })</pre> | n/a | yes |
| <a name="input_level"></a> [level](#input\_level) | Specifies the alarm level | `string` | `"INFO"` | no |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the keywords alarm rule | `string` | n/a | yes |
| <a name="input_notification_rule"></a> [notification\_rule](#input\_notification\_rule) | Specifies the notification rule | <pre>object({<br>    template_name = string<br>    user_name     = string<br>    topics = list(object({<br>      name      = string<br>      topic_urn = string<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_send_notifications"></a> [send\_notifications](#input\_send\_notifications) | Specifies whether to send notifications | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->