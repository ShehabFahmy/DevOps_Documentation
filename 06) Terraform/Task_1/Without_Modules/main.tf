resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc-cidr
  tags = {
    Name = "tf-task1-vpc",
    Created_by = var.me
  }
}

resource "aws_subnet" "my-subnet" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = var.subnet-cidr[1]
  # map_public_ip_on_launch = true

  tags = {
    Name = var.subnet-cidr[0],
    Created_by = var.me
  }
}

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id
  
  tags = {
    Name = "tf-task1-igw"
  }
}

resource "aws_route_table" "my-rtb" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
  }
  
  tags = {
    Name = "tf-task1-rtb"
  }
}

# Apply the route table to a specific subnet
resource "aws_route_table_association" "my-rtb-assoc" {
  subnet_id = aws_subnet.my-subnet.id
  route_table_id = aws_route_table.my-rtb.id
}

# Create a resource of type EC2 instance and
#   of name "aws-linux-instance"
resource "aws_instance" "aws-linux-instance" {
  ami = var.aws-linux-instance-ami
  instance_type = var.instance-type
  key_name = "my-rsa-key"
  subnet_id = aws_subnet.my-subnet.id
  vpc_security_group_ids = [aws_security_group.my-instance-secgrp.id]
  # User Data to run scripts at the instance's launch
  user_data = var.nginx-installation
  # Ensure the instance gets a public IP
  associate_public_ip_address = true

  tags = {
    Name = "my-nginx-instance"
  }
}