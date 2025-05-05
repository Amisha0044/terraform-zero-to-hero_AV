provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {               # referencing the module
  source = "./modules/ec2_instance"   # path of module where it is located and has to be searched at
  # either create .tfvars file or hardcode here
  ami_value = "ami-053b0d53c279acc90" # replace this
  instance_type_value = "t2.micro"
  subnet_id_value = "subnet-019ea91ed9b5252e7" # replace this
}
