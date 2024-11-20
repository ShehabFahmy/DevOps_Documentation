variable "created-by" {
  type = string
}

variable "vpc-id" {
  type = string
}

variable "subnet-cidr" {
  type = tuple([string, string])
}
