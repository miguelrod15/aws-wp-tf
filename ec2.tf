# EC2 module call
module "ec2_instance" {
  source               = "./modules/ec2"
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "t2.micro"
  subnet_id            = module.vpc.public_subnet_id
  security_group_ids   = [module.security_groups.ec2_sg_id]
  iam_instance_profile = module.iam.iam_instance_profile_name

  user_data = templatefile("${path.module}/user_data.sh", {
    db_host     = module.rds.rds_endpoint
    db_username = var.db_username
    db_password = module.secrets.db_password
    db_name     = var.db_name
    region      = var.region
  })

  instance_name = "wordpress-ec2"
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