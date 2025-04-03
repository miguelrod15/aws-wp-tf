output "ec2_public_ip" {
  description = "Public IP of the WordPress EC2 instance"
  value       = module.ec2_instance.public_ip
}

output "rds_endpoint" {
  description = "RDS endpoint for the MySQL database"
  value       = module.rds.rds_endpoint
}

output "db_password" {
  value     = module.secrets.db_password
  sensitive = true
}