module "rds_blue" {
  source              = "./modules/rds"
  identifier          = "wordpress-db-blue"
  subnet_group_name   = "wordpress-db-subnet-group-blue"
  private_subnet_id_a = module.vpc.private_subnet_id_a
  private_subnet_id_b = module.vpc.private_subnet_id_b
  rds_sg_id           = module.security_groups.rds_sg_id
  db_username         = var.db_username
  db_password         = module.secrets.db_password
  db_name             = var.db_name
}

module "rds_green" {
  source              = "./modules/rds"
  identifier          = "wordpress-db-green"
  subnet_group_name   = "wordpress-db-subnet-group-green"
  private_subnet_id_a = module.vpc.private_subnet_id_a
  private_subnet_id_b = module.vpc.private_subnet_id_b
  rds_sg_id           = module.security_groups.rds_sg_id
  db_username         = var.db_username
  db_password         = module.secrets.db_password
  db_name             = var.db_name
}
