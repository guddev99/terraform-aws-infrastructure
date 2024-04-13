# Creates a VPC
resource "aws_vpc" "tf-vpc" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "tf-vpc"
  }
}

# Creates Internet Gateway
resource "aws_internet_gateway" "tf-IG" {
  vpc_id = aws_vpc.tf-vpc.id

  tags = {
    Name = "tf-IG"
  }
}

# Creates Custom Route Table
resource "aws_route_table" "tf-RT" {
  vpc_id = aws_vpc.tf-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-IG.id
  }

  tags = {
    Name = "tf-RT"
  }
}

