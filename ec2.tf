# EC2 module call
module "ec2_instance_blue" {
  source               = "./modules/ec2"
  name                 = "wordpress-blue"
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "t2.micro"
  subnet_id            = module.vpc.public_subnet_id_a
  security_group_ids   = [module.security_groups.ec2_sg_id]
  iam_instance_profile = module.iam.iam_instance_profile_name
  user_data            = "${path.module}/user_data.sh"
  db_host              = module.rds_blue.db_endpoint
  db_username          = var.db_username
  db_password          = module.secrets.db_password
  db_name              = var.db_name
  region               = var.region
}

module "ec2_instance_green" {
  source               = "./modules/ec2"
  name                 = "wordpress-green"
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "t2.micro"
  subnet_id            = module.vpc.public_subnet_id_b
  security_group_ids   = [module.security_groups.ec2_sg_id]
  iam_instance_profile = module.iam.iam_instance_profile_name
  user_data            = "${path.module}/user_data.sh"
  db_host              = module.rds_green.db_endpoint
  db_username          = var.db_username
  db_password          = module.secrets.db_password
  db_name              = var.db_name
  region               = var.region
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
