Created a standard, production-grade Terraform configuration to provision a Amazon EKS cluster using a modular architecture. The configuration must support a standard deployment workflow without using Terraform workspaces. Emphasize reusability through cleanly separated modules and strict variable-driven customization. This setup is designed for execution from a local development laptop with AWS CLI credentials already configured.

Networking (vpc module):
Created a custom VPC with a configurable CIDR block
Included 2 public subnets across 2 availability zones
Included 3 private subnets across 3 availability zones
Attached an internet gateway for public subnets
Created a single NAT gateway in one public subnet
Configured private route tables to use the NAT gateway
Used dynamic blocks for subnet definitions, route table associations, and resource tagging

EKS cluster (eks module):
Deployed the EKS control plane in private subnets
Enabled control plane logging for api, audit, authenticator components
Output the EKS cluster endpoint, certificate, and a generated kubeconfig CLI command
Enable OIDC provider for IRSA use
Used dynamic blocks to enable or disable control plane log types and to apply tags

IAM (iam module):
Created IAM roles and policies for:
EKS control plane
EC2 node instance profile
EBS CSI driver with IRSA trust
Used dynamic blocks to construct IAM assume role trust documents and inline policies
Allow toggling of IRSA feature via variables
Output relevant role ARNs and names for reference in other modules

Terraform structure and practices:
Used a modules/ directory to separate reusable components:
modules/vpc
modules/eks
modules/nodes
modules/iam
modules/bastion
Used a single standard environment without relying on workspaces
All environment customization came through a single set of input variables
At the root level, included:
main.tf
variables.tf
outputs.tf
provider.tf
locals.tf
terraform.tfvars.example

Outputs:
VPC ID and subnet IDs
Cluster name, endpoint, certificate
Kubeconfig CLI string

How to configure:
terraform init
terraform plan
terraform apply

To delete the resources
terraform destroy
