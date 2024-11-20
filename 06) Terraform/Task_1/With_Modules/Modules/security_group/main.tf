resource "aws_security_group" "my-instance-secgrp" {
  vpc_id = var.vpc-id

  ingress {
    from_port = var.ssh-ingress-data["from_port"]
    to_port = var.ssh-ingress-data["to_port"]
    protocol = var.ssh-ingress-data["protocol"]
    cidr_blocks = var.ssh-ingress-data["cidr_blocks"]
  }

  ingress {
    from_port = var.http-ingress-data["from_port"]
    to_port = var.http-ingress-data["to_port"]
    protocol = var.http-ingress-data["protocol"]
    cidr_blocks = var.http-ingress-data["cidr_blocks"]
  }

  egress {
    from_port = var.egress-data["from_port"]
    to_port = var.egress-data["to_port"]
    protocol = var.egress-data["protocol"]
    cidr_blocks = var.egress-data["cidr_blocks"]
  }

  tags = {
    Name = var.secgrp-name
    Created_by = var.created-by
  }
}
