

# Confluent 
confluent = {
  environment = {
    id = "env-zmz2zd"
    share_networks = false
    networks = [
      {
        display_name    = "confluent-plink-network-dev1"
        connection_type = "PRIVATELINK"
        aws = {
          region = "eu-central-1",
          prefix = "mcol",
          owner  = "mcolomercornejo@confluent.io",
          vpc = {
            id = "vpc-08a7122ab9509d860"
          }
          account_id = "492737776546"
        } 
        clusters = [
          {
            display_name = "mcolomer-standard-inventory_dev1"
            availability = "MULTI_ZONE"
            cloud        = "AWS"
            region       = "eu-central-1"
            type         = "DEDICATED"
            cku          = "2" 
          }
        ] 
      },
      {
        display_name    = "confluent-plink-network-dev2"
        connection_type = "PRIVATELINK"
        aws = {
          region = "eu-west-1",
          prefix = "mcol",
          owner  = "mcolomercornejo@confluent.io",
          vpc = {
            id = "vpc-0a067b629f9b6c83c"
          }
          account_id = "492737776546"
        } 
        clusters = [
          {
            display_name = "mcolomer-standard-inventory_dev2"
            availability = "MULTI_ZONE"
            cloud        = "AWS"
            region       = "eu-west-1"
            type         = "DEDICATED"
            cku          = "2" 
          }
        ] 
      }
    ]
  }
}


