resource "aws_instance" "wordpress" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  iam_instance_profile   = var.iam_instance_profile


  user_data = var.user_data

  tags = {
    Name = var.instance_name
  }
}