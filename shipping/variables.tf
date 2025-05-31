variable "project_name" {
  description = "Name of the project, used for resource naming."
  type        = string
  default     = "hashidays-shipping"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.6.0.0/22"
}

variable "ec2_keypair_name" {
  description = "Name of EC2 keypair"
  type        = string
  default     = null
}

variable "aws_default_tags" {
  type        = map(string)
  description = "Default tags added to all AWS resources."
  default = {
    Project = "hashidays-shipping"
  }
}

variable "aws_default_region" {
  type        = string
  description = "The default region that all resources will be deployed into."
  default     = "eu-west-2"
}
