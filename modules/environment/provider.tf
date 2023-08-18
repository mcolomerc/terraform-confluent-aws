terraform {
  required_version = ">= 1.3"
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = ">=1.51.0"   
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.1"  
    } 
  }
}

