resource "aws_instance" "wordpress" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  iam_instance_profile   = var.iam_instance_profile

  user_data = templatefile(var.user_data, {
    db_host     = var.db_host
    db_username = var.db_username
    db_password = var.db_password
    db_name     = var.db_name
    region      = var.region
  })

  tags = {
    Name = var.name
  }
}
