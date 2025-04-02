resource "random_password" "db_password" {
  length             = 16
  special            = true
  override_special   = "!#$%^&*()-_=+[]{}<>:?"
}



resource "aws_secretsmanager_secret" "db_password" {
  name        = "wordpress-db-password-v3"
  description = "WordPress database password"
}

resource "aws_secretsmanager_secret_version" "db_password_version" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = random_password.db_password.result
}
