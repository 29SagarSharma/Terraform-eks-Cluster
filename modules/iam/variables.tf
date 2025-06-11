variable "cluster_name" {}
variable "tags" { type = map(string) }
variable "enable_irsa" { default = true }
variable "oidc_provider_arn" { default = "" }
variable "oidc_provider_url" { default = "" }
