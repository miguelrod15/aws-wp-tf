variable "name" {
  description = "Name for the EC2 instance"
  type        = string
}

variable "ami" {
  description = "AMI ID to use"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "iam_instance_profile" {
  type = string
}

variable "user_data" {
  description = "User data script"
  type        = string
}

variable "db_host" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type        = string
  sensitive   = true
}

variable "db_name" {
  type = string
}

variable "region" {
  type = string
}
