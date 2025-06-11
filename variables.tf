variable "region" {}
variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "cluster_name" {}
variable "ssh_key_name" {}

variable "control_plane_logs" {
  type    = list(string)
  default = ["api", "audit", "authenticator"]
}

variable "enable_irsa" {
  type    = bool
  default = true
}


variable "node_instance_type" { default = "t3.medium" }
variable "node_min_size" { default = 1 }
variable "node_max_size" { default = 3 }
variable "node_desired_capacity" { default = 2 }
variable "kubelet_extra_args" { default = "" }

variable "enable_bastion" { default = false }
variable "bastion_ami_id" {}
variable "bastion_instance_type" { default = "t3.micro" }
variable "bastion_allowed_cidrs" { type = list(string) }
