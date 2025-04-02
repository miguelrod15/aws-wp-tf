resource "aws_db_subnet_group" "wordpress_db_subnet_group" {
  name = "wordpress-db-subnet-group-v2"
  subnet_ids = [
    var.private_subnet_id_a,
    var.private_subnet_id_b
  ]

  tags = {
    Name = "wordpress-db-subnet-group"
  }
}

resource "aws_db_instance" "wordpress_db" {
  identifier        = "wordpress-db"
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "8.0.40"
  instance_class    = "db.t3.micro"
  username          = var.db_username
  password          = var.db_password
  db_name           = var.db_name

  db_subnet_group_name   = aws_db_subnet_group.wordpress_db_subnet_group.name
  vpc_security_group_ids = [var.rds_sg_id]
  publicly_accessible    = false
  skip_final_snapshot    = true
  apply_immediately      = true

  tags = {
    Name = "wordpress-mysql"
  }
}
