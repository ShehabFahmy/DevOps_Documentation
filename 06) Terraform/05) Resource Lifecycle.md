```HCL
resource "aws_subnet" "my-subnet" {
	vpc_id = aws_vpc.my-vpc.id
	cidr_block = var.subnet-cidr

	lifecycle {
		create_before_destroy = true
		prevent_destroy = true   # Won't get destroyed
		ignore_changes = [ tags ]   # Ignore any changes in tags
	}

	tags = {
		Name = "terraform-subnet",
		Created_by = "Shehab"
	}
}
```