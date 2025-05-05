# By default terraform look for "terraform.tfvars" file but if you are using any other file name like dev.tfvars, you have to pass it while running tf command like terraform apply "terraform apply -var-file=dev.tfvars" (similar cmd for plan and destroy also)
# Only this file will need to be changes, not anything else for parameterizing, to pass user-defined values

# ami_value = "ami-01816d07b1128cd2d"
# instance_type_value = "t2.micro"
# subnet_id_value = "subnet-096477182a928c58f"

# but for a module, this file should should be in the module folder. So, no need of this file here.
