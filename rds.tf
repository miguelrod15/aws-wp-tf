module "rds" {
  source = "./modules/rds"

  db_username         = var.db_username
  db_password         = module.secrets.db_password
  db_name             = var.db_name
  private_subnet_id_a = module.vpc.private_subnet_id_a
  private_subnet_id_b = module.vpc.private_subnet_id_b
  rds_sg_id           = module.security_groups.rds_sg_id
}