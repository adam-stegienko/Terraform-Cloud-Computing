output "instance_id" {
  value       = module.Compute.instance_id[*]
  description = "AWS EC2 instance with Ted Search application on it"
}

output "public_ip" {
  value       = module.Compute.public_ip[*]
  description = "AWS EC2 instance's public IP"
}

output "load_balancer" {
  value       = module.Compute.load_balancer
  description = "Load Balancer's DNS address"
}