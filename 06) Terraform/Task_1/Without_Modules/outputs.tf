resource "local_file" "vpc-id-output" {
	content = aws_vpc.my-vpc.id
	filename = "vpc-id-output.txt"
}

resource "local_file" "ec2-ip-output" {
	content = aws_instance.aws-linux-instance.public_ip
	filename = "ec2-ip-output.txt"
}