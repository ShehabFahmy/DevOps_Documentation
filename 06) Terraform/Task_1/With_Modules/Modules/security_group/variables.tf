variable "secgrp-name" {
  type = string
}

variable "created-by" {
  type = string
}

variable "vpc-id" {
  type = string
}

variable "ssh-ingress-data" {
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
}

variable "http-ingress-data" {
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
}

variable "egress-data" {
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
}

# variable "ssh-ingress_from-port" {
#   type = number
#   default = 22
# }

# variable "ssh-ingress_to-port" {
#   type = number
#   default = 22
# }

# variable "ssh-ingress_protocol" {
#   type = string
#   default = "tcp"
# }

# variable "ssh-ingress_cidr-blocks" {
#   type = list(string)
#   default = ["0.0.0.0/0"]
# }