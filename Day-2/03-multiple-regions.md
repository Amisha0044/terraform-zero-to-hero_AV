# Multiple Region Implementation in Terraform

You can make use of `alias` keyword to implement multi region infrastructure setup in
terraform.

```
provider "aws" {
  alias = "ue1"
  region = "us-east-1"
}

provider "aws" {
  alias = "uw2"
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami = "ami-0123456789abcdef0"
  instance_type = "t2.micro"
  provider = "aws.ue1"
}

resource "aws_instance" "example2" {
  ami = "ami-0123456789abcdef0"
  instance_type = "t2.micro"
  provider = "aws.uw2"
}
```
