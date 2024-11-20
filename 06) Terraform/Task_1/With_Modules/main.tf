module "vpc" {
  source = "./Modules/vpc"
  vpc-cidr = "10.0.0.0/16"
  created-by = var.me
}

module "subnet" {
  source = "./Modules/public_subnet"
  subnet-cidr = ["tf-task1-pb-subnet", "10.0.1.0/24"]
  created-by = var.me
  vpc-id = module.vpc.id
}

module "igw" {
  source = "./Modules/internet_gateway"
  igw-name = "tf-task1-igw"
  created-by = var.me
  vpc-id = module.vpc.id
}

module "rtb" {
  source = "./Modules/route_table"
  rtb-name = "tf-task1-rtb"
  created-by = var.me
  vpc-id = module.vpc.id
  subnet-id = module.subnet.id
  igw-id = module.igw.id
}

module "secgrp" {
  source          = "./Modules/security_group"
  secgrp-name     = "tf-task1-secgrp"
  created-by      = var.me
  ssh-ingress-data = {from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"]}
  http-ingress-data = {from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"]}
  egress-data = {from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"]}
  vpc-id = module.vpc.id
}

module "ec2" {
  source = "./Modules/aws_linux_ec2"
  created-by = var.me
  aws-linux-instance-ami = "ami-066784287e358dad1"
  instance-name = "my-apache-instance"
  instance-type = "t2.micro"
  subnet-id = module.subnet.id
  secgrp-id = module.secgrp.id
  user-data = <<-EOF
            #!/bin/bash
            sudo yum install httpd -y
            sudo systemctl start httpd
            EOF
}