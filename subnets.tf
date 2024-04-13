# Creates two subnets
resource "aws_subnet" "tf-subnet-1" {
  vpc_id                  = aws_vpc.tf-vpc.id
  cidr_block              = var.subnet_cidr_block_1
  availability_zone       = var.availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name = "tf-subnet-1"
  }
}

resource "aws_subnet" "tf-subnet-2" {
  vpc_id                  = aws_vpc.tf-vpc.id
  cidr_block              = var.subnet_cidr_block_2
  availability_zone       = var.availability_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name = "tf-subnet-2"
  }
}

# Associate Subnet with Route table
resource "aws_route_table_association" "RT-association-1" {
  subnet_id      = aws_subnet.tf-subnet-1.id
  route_table_id = aws_route_table.tf-RT.id
}

resource "aws_route_table_association" "RT-association-1" {
  subnet_id      = aws_subnet.tf-subnet-2.id
  route_table_id = aws_route_table.tf-RT.id
}
