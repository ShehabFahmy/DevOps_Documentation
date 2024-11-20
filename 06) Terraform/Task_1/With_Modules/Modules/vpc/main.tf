# Task 1
resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc-cidr
  tags = {
    Name       = "tf-task1-vpc",
    Created_by = var.created-by
  }
}
