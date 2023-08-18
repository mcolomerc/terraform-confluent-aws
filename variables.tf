# Confluent Cloud Credentials  
variable "confluent_cloud_api_key" {
  type        = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_key=\"API_KEY\""
}

variable "confluent_cloud_api_secret" {
  type        = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_secret=\"API_SECRET\""
}

# Confluent
variable "confluent" {
  type = object({
    environment = object({
      id = string
      share_networks = bool
      networks = list(object({
        display_name    = string
        connection_type = string
        aws = object({
          region = string
          prefix = string
          owner  = string
          vpc = object({
            id = string
          })
          account_id = string
        })
        clusters = list(object({
          display_name = string
          availability = string
          cloud        = string
          region       = string
          type         = string
          cku          = optional(string)
          config = optional(map(string)
          ) 
        })) 
      }))
    })
  })
}
