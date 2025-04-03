variable "region" {
  default = "eu-west-2"
}

variable "availability_zone" {
  default = "eu-west-2a"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "public_subnet_az" {
  description = "Availability Zone for the public subnet"
  default     = "eu-west-2a"
}

variable "private_subnet_cidr_a" {
  default = "10.0.3.0/24"
}

variable "private_subnet_cidr_b" {
  default = "10.0.4.0/24"
}

variable "db_username" {
  default = "admin"
}

variable "db_name" {
  default = "wordpress_db"
}