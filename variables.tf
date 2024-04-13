###############################
# Provider variables
###############################
variable "aws_region" {
  description = "The AWS region"
  default     = "us-east-1"
}

###############################
# VPC variables
###############################
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

###############################
# Subnet variables
###############################
variable "subnet_cidr_block_1" {
  description = "The CIDR block for subnet 1"
  default     = "10.0.1.0/24"
}

variable "subnet_cidr_block_2" {
  description = "The CIDR block for subnet 2"
  default     = "10.0.2.0/24"
}

variable "availability_zone_1" {
  description = "The availability zone for subnet 1"
  default     = "us-east-1a"
}

variable "availability_zone_2" {
  description = "The availability zone for subnet 2"
  default     = "us-east-1b"
}

###############################
# Launch Template variables
###############################
variable "image_id" {
  description = "The ID of the AMI to use for instances"
  default     = "ami-080e1f13689e07408" # Ubuntu, 22.04 LTS, amd64 jammy image
}

variable "key_name" {
  description = "The name of the SSH key pair to use for instances"
  default     = "test-key"
}
