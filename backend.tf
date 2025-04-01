terraform {
  backend "s3" {
    bucket         = "wordpress-terraform-state-miguel"
    key            = "state/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
  }
}
