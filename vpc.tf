module "vpc" {
  source                = "./modules/vpc"
  public_subnet_cidr_a =  var.public_subnet_cidr_a
  public_subnet_cidr_b  = var.public_subnet_cidr_b
  private_subnet_cidr_a = var.private_subnet_cidr_a
  private_subnet_cidr_b = var.private_subnet_cidr_b
  public_subnet_az      = var.public_subnet_az
}
