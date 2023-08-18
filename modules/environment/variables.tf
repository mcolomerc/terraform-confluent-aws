# Confluent
variable "confluent" {
  type = object({
    environment = object({
      id = string
      network = object({
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
      })
    })
  })
}
