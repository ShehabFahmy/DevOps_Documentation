Can be used to model specific actions on the local machine or on a remote machine in order to prepare servers.
Examples:
- Installing Packages
- Passing Information
- Running Configuration Management Tool
## Types
1. File Provisioner
   - To copy files or directories from the machine executing Terraform to the newly created resource.
   - Supports both `ssh` and `winrm` type of connections
	```HCL
	# Copies a file from local machine to EC2 instance
	provisioner "file" {
		source = "path/to/file/on/local/machine"
		destination = "path/to/directory/on/ec2/instance"
		connection {
			type = "ssh"
			host = self.public_ip
			user = "ec2-user"
			password = ""
			private_key = file("path/to/private-key.pem")
		}
	}
	
	# Copies a directory from local to EC2
	provisioner "file" {
		source = "path/to/directory/on/local/machine"
		destination = "path/to/directory/on/ec2/instance"
		connection {...}
	}
	```
2. Local-exec Provisioner
   - Invokes a local executable after a resource is created.
   - This invokes a process on the machine running Terraform, not on the resource.
   ```HCL
   # Triggered during Create Resource
   resource "null_resource" "apply-command" {
	   provisioner "local-exec" {
		   command = "echo ${aws_instance.my-ec2.private_ip} >> creation-time-private-ip.txt"
		   working_dir = "local-exec-output-files/"
	   }
   }
   
   # Triggered during Destroy Resource
   resource "null_resource" "apply-command" {
	   provisioner "local-exec" {
		   when = destroy
		   command = "echo Destroy-time provisioner Instance Destroyed at `date` >> destroy-time.txt"
		   working_dir = "local-exec-output-files/"
	   }
   }
	```
3. Remote-exec Provisioner
   - Invokes a script on a remote resource after it is created.
   - This can be used to run a configuration management tool, bootstrap into a cluster, etc.
   ```HCL
   provisioner "remote-exec" {
	   inline = [
		   "echo Hello"
		   "echo World"
	   ]
	   connection {...}
   }
	```