output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster.arn
}

output "node_role_name" {
  value = aws_iam_role.eks_node.name
}

output "node_instance_profile_name" {
  value = aws_iam_instance_profile.eks_node.name
}

output "ebs_csi_role_arn" {
  value = var.enable_irsa ? aws_iam_role.ebs_csi_irsa[0].arn : null
}


