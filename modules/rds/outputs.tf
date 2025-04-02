output "rds_endpoint" {
  value = aws_db_instance.wordpress_db.address
}

output "db_instance_id" {
  description = "The ID of the RDS DB instance"
  value       = aws_db_instance.wordpress_db.id
}
