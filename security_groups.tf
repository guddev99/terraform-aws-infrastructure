# Creates Security Group to allow port 80 and 443 for ALB
resource "aws_security_group" "tf-ALB-SG" {
  name        = "tf-ALB-SG"
  description = "Security Group to allow HTTP and HTTPS"
  vpc_id      = aws_vpc.tf-vpc.id

  ingress {
    description = "Allows HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allows HTTPS"
    from_port   = 443
    to_port     = 443
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
    Name = "tf-ALB-SG"
  }
}

# Creates Security Group to allow port 22 and 80 for EC2 instances from ALB
resource "aws_security_group" "tf-SG" {
  name        = "tf-SG"
  description = "Security Group to allow SSH and HTTP"
  vpc_id      = aws_vpc.tf-vpc.id

  ingress {
    description     = "Allows SSH"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.tf-ALB-SG.id]
  }

  ingress {
    description     = "Allows HTTP"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.tf-ALB-SG.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf-SG"
  }
}

