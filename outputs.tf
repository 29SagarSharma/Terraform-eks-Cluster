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


