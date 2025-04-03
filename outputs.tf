output "ec2_blue_ip" {
  value = module.ec2_instance_blue.public_ip
}

output "ec2_green_ip" {
  value = module.ec2_instance_green.public_ip
}

output "rds_blue_endpoint" {
  value = module.rds_blue.db_endpoint
}

output "rds_green_endpoint" {
  value = module.rds_green.db_endpoint
}


output "db_password" {
  value     = module.secrets.db_password
  sensitive = true
}

output "alb_dns_name" {
  description = "Public DNS name of the Application Load Balancer"
  value       = aws_lb.wordpress_alb.dns_name
}