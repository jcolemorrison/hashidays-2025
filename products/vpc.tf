module "vpc" {
  source     = "app.terraform.io/hashicorp-team-demo/vpc-base/aws"
  version    = "0.5.0"
  cidr_block = var.vpc_cidr_block
  name       = "network-${var.project_name}"
}