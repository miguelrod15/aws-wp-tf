# RDS Subnet Group (for private subnets)
resource "aws_db_subnet_group" "wordpress_db_subnet_group" {
  name       = "wordpress-db-subnet-group"
  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
    
 ]

  tags = {
    Name = "wordpress-db-subnet-group"
  }
}

# RDS MySQL Database Instance
resource "aws_db_instance" "wordpress_db" {
  identifier              = "wordpress-db"
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0.40"
  instance_class          = "db.t3.micro" # Free Tier eligible
  username                = var.db_username
  password                = random_password.db_password.result
  db_name                 = var.db_name

  db_subnet_group_name    = aws_db_subnet_group.wordpress_db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  publicly_accessible     = false
  skip_final_snapshot     = true
  apply_immediately       = true

  tags = {
    Name = "wordpress-mysql"
  }
}
