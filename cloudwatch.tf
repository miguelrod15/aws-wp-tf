module "cloudwatch" {
  source            = "./modules/cloudwatch"
  ec2_instance_id   = module.ec2_instance_blue.instance_id
  rds_instance_id   = module.rds_blue.db_instance_id
  region            = var.region
}
