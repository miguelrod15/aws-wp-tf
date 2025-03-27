# Security Group for EC2 (public instance)
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Security group for EC2 instance"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "ec2-sg"
  }
}

resource "aws_security_group_rule" "ec2_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_sg.id
  description       = "Allow HTTP"
}

resource "aws_security_group_rule" "ec2_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_sg.id
  description       = "Allow HTTPS"
}

resource "aws_security_group_rule" "ec2_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["81.84.124.177/32"]
  security_group_id = aws_security_group.ec2_sg.id
  description       = "Allow SSH from my IP"
}

resource "aws_security_group_rule" "ec2_all_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2_sg.id
  description       = "Allow all outbound traffic"
}


# Security Group for RDS (only accessible from EC2)
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Security group for RDS"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "rds-sg"
  }
}

resource "aws_security_group_rule" "rds_mysql" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.ec2_sg.id
  security_group_id        = aws_security_group.rds_sg.id
  description              = "Allow MySQL from EC2"
}

resource "aws_security_group_rule" "rds_all_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rds_sg.id
  description       = "Allow all outbound traffic"
}