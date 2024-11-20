# Task 1
resource "aws_internet_gateway" "my-igw" {
  vpc_id = var.vpc-id

  tags = {
    Name = var.igw-name
    Created_by = var.created-by
  }
}
