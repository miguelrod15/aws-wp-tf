variable "ami" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group_ids" {
  type = list(string)
}
variable "iam_instance_profile" {}
variable "user_data" {}
variable "instance_name" {}
