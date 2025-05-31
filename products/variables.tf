variable "project_name" {
  description = "Name of the project, used for resource naming."
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
  type        = string
}