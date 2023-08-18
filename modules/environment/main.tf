 
module "network" { 
  source   = "github.com/mcolomerc/terraform-confluent-aws-network" 
  environment = var.confluent.environment.id
  providers = {
    confluent.confluent_cloud = confluent 
    aws = aws
  }
  aws = {
    region = var.confluent.environment.network.aws.region,
    prefix = var.confluent.environment.network.aws.prefix,
    owner  = var.confluent.environment.network.aws.owner,
    vpc = {
      id = var.confluent.environment.network.aws.vpc.id,
    }
    account_id = var.confluent.environment.network.aws.account_id,
  }
  confluent_network = {
    display_name    = var.confluent.environment.network.display_name,
    connection_type = var.confluent.environment.network.connection_type,
  } 
}

 module "cluster" {
    for_each        = { for cluster in var.confluent.environment.network.clusters : cluster.display_name => cluster }
    source          = "github.com/mcolomerc/terraform-confluent-kafka-cluster"
    environment     = var.confluent.environment.id
    cluster         = each.value
    network         = module.network.private_link_confluent_network.id 
    providers = {
      confluent.confluent_cloud = confluent
    }
  }

 
