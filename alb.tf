# Create a Security Group for the ALB
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Security group for ALB"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-sg"
  }
}

# Application Load Balancer
resource "aws_lb" "wordpress_alb" {
  name               = "wordpress-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [
    module.vpc.public_subnet_id_a,
    module.vpc.public_subnet_id_b,
    ]

  tags = {
    Name = "wordpress-alb"
  }
}

# Target Group (initially attached to blue instance)
resource "aws_lb_target_group" "wordpress_tg" {
  name     = "wordpress-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "wordpress-tg"
  }
}

# Attach blue EC2 instance to Target Group
resource "aws_lb_target_group_attachment" "blue_attachment" {
  target_group_arn = aws_lb_target_group.wordpress_tg.arn
  target_id        = module.ec2_instance_blue.instance_id
  port             = 80
}

# Attach green EC2 instance to Target Group
resource "aws_lb_target_group_attachment" "green_attachment" {
  target_group_arn = aws_lb_target_group.wordpress_tg.arn
  target_id        = module.ec2_instance_green.instance_id
  port             = 80
}


# Listener to forward requests to the Target Group
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.wordpress_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wordpress_tg.arn
  }
}
