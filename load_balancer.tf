# Creates a Target Group
resource "aws_lb_target_group" "tf-TG" {
  name        = "tf-TG"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.tf-vpc.id
  target_type = "instance"

  tags = {
    Name = "tf-TG"
  }
}

# Creates an Application Load Balancer
resource "aws_lb" "tf-alb" {
  name               = "tf-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tf-ALB-SG]
  subnets            = [aws_subnet.tf-subnet-1.id, aws_subnet.tf-subnet-2.id]

  tags = {
    Name = "tf-alb"
  }
}

# Creates a listener for the ALB
resource "aws_lb_listener" "tf_alb_listener" {
  load_balancer_arn = aws_lb.tf-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.tf-TG.arn
    type             = "forward"
  }
}
