variable "region" {
  type = string
  default = "us-east-1"
}

variable "me" {
  type = string
  default = "Shehab"
}

variable "vpc-cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnet-cidr" {
  type    = tuple([string, string])
  default = ["tf-task1-pb-subnet", "10.0.1.0/24"]
}

variable "aws-linux-instance-ami" {
  type = string
  default = "ami-066784287e358dad1"
}

variable "instance-type" {
  type = string
  default = "t2.micro"
}

variable "nginx-installation" {
  type = string
  default = <<-EOF
            #!/bin/bash
            sudo yum install httpd -y
            sudo systemctl start httpd
            EOF
}