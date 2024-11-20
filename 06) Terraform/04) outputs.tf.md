## Print in Terminal
```HCL
output "my-vpc-arn" {
	value = aws_vpc.my-vpc.arn
}
```
## Save into Local File
```HCL
resource "local_file" "vpc-output" {
	content = aws_vpc.my-vpc.arn
	filename = "vpc-output.txt"
}
```
***NOTE:*** You have to run `terraform init` to download the config files for Terraform's Local File.