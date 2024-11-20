1. Create a resource of type `aws_instance` (EC2 instance) and of name `aws-linux-instance`
```HCL
resource "aws_instance" "aws-linux-instance" {
	ami = ami = var.aws-linux-instance-ami   # Created in variables.tf
	instance_type = "t2.micro"
	key_name = "my-rsa-key"
	security_groups = ["${aws_security_group.my-instance-secgrp.name}"]   # Created in security.tf

	tags = {
		Name = "my-instance"
	}
}
```
2. Check your instance to be created without creating it \[Optional\]:
```sh
terraform plan
```
3. Apply your plan:
```sh
terraform apply
```