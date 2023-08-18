output "environment_eu-central-1"  {
  value = module.environment_eu-central-1[*] 
}

output "environment_eu-west-1"  {
  value = module.environment_eu-west-1[*] 
}

output "network_share"{
  value = module.network_sharing
}