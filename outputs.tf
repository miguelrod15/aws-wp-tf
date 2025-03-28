output "ec2_public_ip" {
  description = "Public IP of the WordPress EC2 instance"
  value       = aws_instance.wordpress.public_ip
}

output "rds_endpoint" {
  description = "RDS endpoint for the MySQL database"
  value       = aws_db_instance.wordpress_db.address
}
