module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
  tags                 = local.tags
}


module "iam" {
  source            = "./modules/iam"
  cluster_name      = var.cluster_name
  enable_irsa       = var.enable_irsa
  oidc_provider_arn = module.eks.oidc_provider_arn
  oidc_provider_url = module.eks.oidc_provider_url
  tags              = local.tags
}

module "eks" {
  source             = "./modules/eks"
  cluster_name       = var.cluster_name
  cluster_role_arn   = module.iam.eks_cluster_role_arn
  subnet_ids         = module.vpc.private_subnet_ids
  control_plane_logs = var.control_plane_logs
  enable_irsa        = var.enable_irsa
  tags               = local.tags
  region             = var.region
}

module "nodes" {
  source                = "./modules/nodes"
  cluster_name          = module.eks.cluster_name
  kubernetes_version    = "1.29"
  node_labels           = ["role=worker", "env=prod"]
  kubelet_args          = "--max-pods=110 --eviction-hard=memory.available<200Mi,nodefs.available<10%"
  instance_type         = var.node_instance_type
  ssh_key_name          = var.ssh_key_name
  instance_profile_name = module.iam.node_instance_profile_name
  subnet_ids            = module.vpc.private_subnet_ids
  min_size              = var.node_min_size
  max_size              = var.node_max_size
  desired_capacity      = var.node_desired_capacity
  kubelet_extra_args    = var.kubelet_extra_args
  tags                  = local.tags
}

module "bastion" {
  source         = "./modules/bastion"
  enable_bastion = var.enable_bastion
  ami_id         = var.bastion_ami_id
  instance_type  = var.bastion_instance_type
  subnet_id      = module.vpc.public_subnet_ids[0]
  vpc_id         = module.vpc.vpc_id
  ssh_key_name   = var.ssh_key_name
  allowed_cidrs  = var.bastion_allowed_cidrs
  name_prefix    = var.cluster_name
  tags           = local.tags
}



