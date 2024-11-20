- `security.tf`:
```HCL
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "TerraformKP" {
  key_name = "my-tf-key"
  public_key = var.public-key

  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.private_key_pem}' > ~/Desktop/Terraform/my-tf-key.pem"
  }
}
```
- `variables.tf`:
```HCL
variable "public-key" {
  description = "My SSH Public Key"
  type = string
}
```
- `terraform.tfvars`: this file will be included in `.gitignore` as it contains the public key of your machine.
```HCL
public-key = "EXAMPLEyourpublickey"
```