# Priority-based Ordering
## 1. Passing Variable in Terminal
### One Variable
```sh
terraform plan --var <var_name>="<var_value>"
```
## 2. Passing `variables.tfvars` in Terminal
- `.tfvars` files are manually loaded and must be specified using the `-var-file` flag (Terraform **won't use** the `.tfvars` file unless you specify it explicitly with `-var-file`).
- Example Use Case: If you have environment-specific variables (e.g., for production, staging, or development), you can create different `.tfvars` files (`prod.tfvars`, `dev.tfvars`, etc.) and specify the appropriate one at runtime using the `-var-file` option.
```sh
terraform plan --var-file "<path/to/variables.tfvars>"
```
## 3. `variables.auto.tfvars` File
- `.auto.tfvars` files are automatically loaded by Terraform.
- Example Use Case: If you have common variable settings that should always be applied, you can put them in `variables.auto.tfvars`. Terraform will automatically load this file every time it runs.
```HCL
instance_type  = "t3.medium"
region         = "us-east-1"
instance_count = 3
```
## 4. Export Environment Variable
```sh
export variable="value"
```
## 5. `variables.tf` File (default)
```HCL
variable "region" {
  type = string
  default = "us-east-1"
}

variable "aws-linux-instance-ami" {
  type = string
  default = "ami-066784287e358dad1"
}
```