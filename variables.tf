# General region (used in provider)
variable "region" {
  default = "eu-west-2"
}

# Availability zone (used in subnets)
variable "availability_zone" {
  default = "eu-west-2a"
}

# VPC CIDR
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

# Subnet CIDRs
variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr_a" {
  default = "10.0.3.0/24"
}

variable "private_subnet_cidr_b" {
  default = "10.0.4.0/24"
}


# RDS configuration
variable "db_username" {
  default = "admin"
}

variable "db_name" {
  default = "wordpress_db"
}
