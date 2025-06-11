variable "cluster_name" {}
variable "cluster_role_arn" {}
variable "subnet_ids" { type = list(string) }
variable "control_plane_logs" {
  type    = list(string)
  default = []
}

variable "enable_irsa" { default = true }
variable "tags" { type = map(string) }
variable "region" { default = "us-east-1" }
