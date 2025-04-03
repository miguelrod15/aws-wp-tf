variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group_ids" {
  type = list(string)
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to attach to EC2"
  type        = string
}

variable "user_data" {}
variable "instance_name" {}