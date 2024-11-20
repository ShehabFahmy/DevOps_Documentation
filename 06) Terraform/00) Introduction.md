## What is Terraform?
-> Infrastructure Provisioning Tool:
1. Prepare infrastructure
2. Deploy application
## Why Terraform?
- Automate infrastructure deployment
- Manage your infrastructure
- Manage services that run on the infrastructure
## Terraform vs Ansible
- Terraform: mainly an infrastructure provisioning tool. can be used to deploy applications.
- Ansible: mainly a configuration tool:
	- Configure infrastructure
	- Deploy application
	- Install updates and software
---
## Installation
```shell
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```
---
## Creating your Terraform Folder
1. Create a new folder and open it in VS Code
2. Create a new file called `providers.tf` to configure your cloud service provider (e.g. AWS).
```HCL
provider "aws" {
	profile = "default"
	region = "us-east-1"   # = var.region if you have variables.tf
}
```
3. Initialize the current directory to be a Terraform directory:
```sh
terraform init
```
---
## Commands

| Command             | Description                                               |
| ------------------- | --------------------------------------------------------- |
| `terraform init`    | Configure the current directory to be a Terraform project |
| `terraform plan`    | Review for execution, no action taken                     |
| `terraform apply`   | Compile and run the Terraform files                       |
| `terraform destroy` | Delete all resources created by Terraform in the project  |
| `terraform show`    | Show created resources                                    |
