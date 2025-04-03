variable "public_subnet_cidr_a" {
  default = "10.0.1.0/24"
}

variable "public_subnet_cidr_b" {
  default = "10.0.2.0/24"
}

variable "private_subnet_cidr_a" {
  description = "CIDR block for private subnet A"
  type        = string
}

variable "private_subnet_cidr_b" {
  description = "CIDR block for private subnet B"
  type        = string
}

variable "public_subnet_az" {
  description = "Availability Zone for public subnet"
  type        = string
}
