output "db_password" {
  value     = random_password.db_password.result
  sensitive = true
}


output "secret_name" {
  description = "Name of the stored secret"
  value       = aws_secretsmanager_secret.db_password.name
}
