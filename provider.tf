# Configure the Confluent Cloud Provider
terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent" 
      configuration_aliases = [ confluent.confluent_cloud ]
    }
     aws = {
      source  = "hashicorp/aws"
      version = "5.0.1" 
      configuration_aliases = [ aws.eu-central-1, aws.eu-west-1 ]
    } 
  } 
  required_version = ">= 1.3.0"
}

provider "aws" {
  alias = "eu-central-1" 
  region = "eu-central-1"
}

provider "aws" {
  alias = "eu-west-1" 
  region = "eu-west-1"
}

provider "confluent" { 
  alias = "confluent_cloud" 
  cloud_api_key    = var.confluent_cloud_api_key
  cloud_api_secret = var.confluent_cloud_api_secret
}