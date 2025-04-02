variable "db_username" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "private_subnet_id_a" {
  description = "Private subnet A"
  type        = string
}

variable "private_subnet_id_b" {
  description = "Private subnet B"
  type        = string
}

variable "rds_sg_id" {
  description = "Security group ID for RDS"
  type        = string
}
