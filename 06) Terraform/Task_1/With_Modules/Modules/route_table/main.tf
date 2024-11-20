# Task 1
resource "aws_route_table" "my-rtb" {
  vpc_id = var.vpc-id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw-id
  }

  tags = {
    Name = var.rtb-name
    Created_by = var.created-by
  }
}

# Apply the route table to a specific subnet
resource "aws_route_table_association" "my-rtb-assoc" {
  subnet_id      = var.subnet-id
  route_table_id = aws_route_table.my-rtb.id
}
