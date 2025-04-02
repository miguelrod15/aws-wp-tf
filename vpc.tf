module "vpc" {
  source                = "./modules/vpc"
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet_cidr_a = var.private_subnet_cidr_a
  private_subnet_cidr_b = var.private_subnet_cidr_b
  public_subnet_az      = var.public_subnet_az
}
