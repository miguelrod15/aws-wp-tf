module "iam" {
  source     = "./modules/iam"
  secret_arn = module.secrets.secret_arn
}