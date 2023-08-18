# Confluent AWS Environment

- Create Confluent Networks (AWS Private Link)
- Create Confluent Cloud Dedicated clusters
- Share Networks on the same environment



## Share Networks between environments

Default: false

If enabled:

```hcl
confluent = {
  environment = {
    id = "env-zmz2zd"
    share_networks = true
```

*"2 Steps"* run 
(The arguments to count and for_each cannot be "known after apply", because Terraform must know what resource instances it needs to plan. This is noted in the count and for_each documentation): 

1) Create Environments, networks and clusters

`terraform plan -var-file=dev.tfvars -target=module.environment_eu-central-1 -target=module.environment_eu-west-1`

`terraform apply -var-file=dev.tfvars -target=module.environment_eu-central-1 -target=module.environment_eu-west-1`

 
2) Share Networks
`terraform apply -var-file=dev.tfvars` 


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.0.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_environment_eu-central-1"></a> [environment\_eu-central-1](#module\_environment\_eu-central-1) | ./modules/environment | n/a |
| <a name="module_environment_eu-west-1"></a> [environment\_eu-west-1](#module\_environment\_eu-west-1) | ./modules/environment | n/a |
| <a name="module_network_sharing"></a> [network\_sharing](#module\_network\_sharing) | /Users/mcolomercornejo/terraform-confluent-network-share | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_confluent"></a> [confluent](#input\_confluent) | Confluent | <pre>object({<br>    environment = object({<br>      id = string<br>      share_networks = bool<br>      networks = list(object({<br>        display_name    = string<br>        connection_type = string<br>        aws = object({<br>          region = string<br>          prefix = string<br>          owner  = string<br>          vpc = object({<br>            id = string<br>          })<br>          account_id = string<br>        })<br>        clusters = list(object({<br>          display_name = string<br>          availability = string<br>          cloud        = string<br>          region       = string<br>          type         = string<br>          cku          = optional(string)<br>          config = optional(map(string)<br>          ) <br>        })) <br>      }))<br>    })<br>  })</pre> | n/a | yes |
| <a name="input_confluent_cloud_api_key"></a> [confluent\_cloud\_api\_key](#input\_confluent\_cloud\_api\_key) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_key="API\_KEY" | `string` | n/a | yes |
| <a name="input_confluent_cloud_api_secret"></a> [confluent\_cloud\_api\_secret](#input\_confluent\_cloud\_api\_secret) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_secret="API\_SECRET" | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_environment_eu-central-1"></a> [environment\_eu-central-1](#output\_environment\_eu-central-1) | n/a |
| <a name="output_environment_eu-west-1"></a> [environment\_eu-west-1](#output\_environment\_eu-west-1) | n/a |
| <a name="output_network_share"></a> [network\_share](#output\_network\_share) | n/a |
<!-- END_TF_DOCS -->