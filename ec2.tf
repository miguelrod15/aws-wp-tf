resource "aws_instance" "wordpress" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  user_data              = templatefile("${path.module}/user_data.sh", {
  db_host                = aws_db_instance.wordpress_db.address
  db_username            = var.db_username
  db_password            = random_password.db_password.result
  db_name                = var.db_name
})


  tags = {
    Name = "wordpress-ec2"
  }
}

# Lookup for Ubuntu AMI (latest LTS in eu-west-2)
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
