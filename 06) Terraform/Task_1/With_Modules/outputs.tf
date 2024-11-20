resource "local_file" "vpc-id-output" {
	content = module.vpc.id
	filename = "vpc-id-output.txt"
}

resource "local_file" "ec2-ip-output" {
	content = module.ec2.public-ip
	filename = "ec2-ip-output.txt"
}