1) You should have a directory, called modules, that contains directories of your resources/modules.
2) Each module directory should contain 3 files: `main.tf`, `output.tf` and `variables.tf`.
3) In your project's `main.tf`:
```HCL
module <module_name> {
	source = "./modules/<resource>"
}
```
4) In your project's `output.tf`: you will link the output of the module with the project's output.
```HCL
output "project's_output" {
	value = module.<module_name>.<module's_output_name>
}
```