## Count
- `main.tf`:
```HCL
resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc-cidr
  tags = {
    Name = "terraform-vpc",
    Created_by = "Shehab"
  }
}

resource "aws_subnet" "my-subnet" {
	count = length(var.subnet-cidr)   # count = 3
	vpc_id = aws_vpc.my-vpc.id
	cidr_block = var.subnet-cidr[count.index]

	tags = {
		Name = "terraform-subnet",
		Created_by = "Shehab"
	}
}
```
- `variables.tf`
```HCL
variable "subnet-cidr" {
	description = "this is vpc cidr range"
	type = list(string)
	default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
}
```
## For Each
- `main.tf`:
```HCL
resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc-cidr
  tags = {
    Name = "terraform-vpc",
    Created_by = "Shehab"
  }
}

resource "aws_subnet" "my-subnet" {
  for_each = var.subnet-data
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = each.value[0]
  availability_zone = each.value[1]

  tags = {
    Name = each.key,
    Created_by = "Shehab"
  }
}
```
- `variables.tf`:
```HCL
variable "vpc-cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnet-data" {
  type = map(list(string))
  default = {
    "Subnet_1" = ["10.0.1.0/24", "us-east-1a"],
    "Subnet_2" = ["10.0.2.0/24", "us-east-1b"],
    "Subnet_3" = ["10.0.3.0/24", "us-east-1c"],
    "Subnet_4" = ["10.0.4.0/24", "us-east-1d"]
  }
}
```