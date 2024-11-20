# Task 1
resource "aws_subnet" "my-subnet" {
  vpc_id     = var.vpc-id
  cidr_block = var.subnet-cidr[1]
  # map_public_ip_on_launch = true

  tags = {
    Name       = var.subnet-cidr[0],
    Created_by = var.created-by
  }
}