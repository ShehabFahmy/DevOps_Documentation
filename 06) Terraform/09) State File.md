## Remote State Backend using S3 and DynamoDB
- `backend.tf`:
```HCL
# Create S3
resource "aws_s3_bucket" "myBucket"{
	bucket = "s3statebackend"
	
	lifecycle {
		prevent_destroy = true
	}
	
	versioning {
		enabled = true
	}
	
	server_side_encryption_configuration {
		rule {
			apply_server_side_encryption_by_default {
				sse_algorithm = "aws:kms"   # or AES256
			}
		}
	}
}

# Create DynamoDB
resource "aws_dynamodb_table" "stateLock" {
	name = "state-lock"
	billing_mode = "PAY_PER_REQUEST"
	hash_key = "LockID"
	
	attribute {
		name = "LockID"
		type = "S"
	}
}
```
- `providers.tf`:
```HCL
terraform {
	backend "s3" {
		bucket = "s3statebackend"
		dynamodb_table = "state-lock"
		key = "dev/statefile/terraform.tfstate"   # Path in S3
		region = "us-east-1"
		encrypt = true
	}
}
```
- Run `terraform init` to migrate to S3 backend.
***To return to local state:** comment out the backend block in the `providers.tf` file, then run `terraform init -migrate-state`.*