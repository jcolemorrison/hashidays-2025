variable "project_name" {
  description = "Name of the project, used for resource naming."
  type        = string
  default     = "hashidays_products"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.5.0.0/22"
}