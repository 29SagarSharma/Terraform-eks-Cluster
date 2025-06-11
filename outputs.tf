output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.endpoint
}

output "cluster_certificate" {
  value = module.eks.certificate
}

output "kubeconfig_command" {
  value = module.eks.kubeconfig_command
}

output "node_asg_name" {
  value = module.nodes.asg_name
}

output "bastion_public_ip" {
  value       = var.enable_bastion ? module.bastion.public_ip : null
  description = "Public IP of bastion host"
}

output "bastion_ssh_command" {
  value       = var.enable_bastion ? module.bastion.ssh_command : null
  description = "SSH command for bastion host"
}


