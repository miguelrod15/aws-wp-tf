output "rds_endpoint" {
  value = aws_db_instance.wordpress_db.address
}

output "db_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.wordpress_db.endpoint
}

output "db_instance_id" {
  description = "The ID of the RDS instance"
  value       = aws_db_instance.wordpress_db.id
}
