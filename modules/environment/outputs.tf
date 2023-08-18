output "network_id" {
  value = module.network.private_link_confluent_network.id
}

output "confluent_cluster" {
  value = module.cluster[*]
}