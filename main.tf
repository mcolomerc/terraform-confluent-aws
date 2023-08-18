
/*
  Scenario: Existing VPC and Subnets
    - Confluent Environment with multiple networks
    - Create a Confluent Cloud network(s)
*/ 
// Can't set the AWS provider for the module dynamically. Need to set the provider by region first and then use the alias in the module.
module "environment_eu-central-1" {
  for_each = { for network in var.confluent.environment.networks : network.display_name => network if network.aws.region == "eu-central-1" }
  source   = "./modules/environment" 
  providers = {
    confluent = confluent.confluent_cloud
    aws  = aws.eu-central-1
  }
  confluent = {
    environment = {
      id = var.confluent.environment.id
      network = {
          display_name    = each.value.display_name
          connection_type = each.value.connection_type
          aws = {
            region = each.value.aws.region
            prefix = each.value.aws.prefix
            owner  = each.value.aws.owner
            vpc = {
              id = each.value.aws.vpc.id
            }
            account_id = each.value.aws.account_id
          }
          clusters = each.value.clusters
        } 
    }
  } 
}

// Can't set the AWS provider for the module dynamically. Need to set the provider by region first and then use the alias in the module.
module "environment_eu-west-1" {
  for_each = { for network in var.confluent.environment.networks : network.display_name => network if network.aws.region == "eu-west-1" }
  source   = "./modules/environment" 
  providers = {
    confluent = confluent.confluent_cloud
    aws  = aws.eu-west-1
  }
  confluent = {
    environment = {
      id = var.confluent.environment.id
      network = {
          display_name    = each.value.display_name
          connection_type = each.value.connection_type
          aws = {
            region = each.value.aws.region
            prefix = each.value.aws.prefix
            owner  = each.value.aws.owner
            vpc = {
              id = each.value.aws.vpc.id
            }
            account_id = each.value.aws.account_id
          }
          clusters = each.value.clusters
        } 
    }
  } 
}

 locals {
  networks_eu-central-1 = values(module.environment_eu-central-1).*.network_id
  networks_eu-west-1 = values(module.environment_eu-west-1).*.network_id

  networks = concat(local.networks_eu-central-1, local.networks_eu-west-1)
  
 }

module "network_sharing" { 
  count = var.confluent.environment.share_networks ? 1 : 0
  source   = "github.com/mcolomerc/terraform-confluent-network-share" 
  environment = var.confluent.environment.id
  providers = {
    confluent.confluent_cloud = confluent.confluent_cloud 
  }
  confluent_cloud_network_ids = local.networks
  depends_on = [
    module.environment_eu-central-1, 
    module.environment_eu-west-1
  ]
}
 
