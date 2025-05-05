# Terraform Providers
1) Official - backed(created, managed and maintained) by Hashicorp - AWS, Azure, GCP, Kubernetes
2) Partner - created, managed and maintained by the provider itself to allow infra creation/mgmt using terraform - Alibaba Cloud, Oracle Cloud Infrastructure
3) Community - created, managed and maintained by anyone like you in open-source way


# Multiple Providers

You can use multiple providers in one single terraform project. For example,


1. Create a providers.tf file in the root directory of your Terraform project.
2. In the providers.tf file, define the AWS and Azure providers. For example:


```
provider "aws" {
  region = "us-east-1"
}

provider "azurerm" {
  subscription_id = "your-azure-subscription-id"
  client_id = "your-azure-client-id"
  client_secret = "your-azure-client-secret"
  tenant_id = "your-azure-tenant-id"
}
```

3. In your other Terraform configuration files, you can then use the aws and azurerm providers to create resources in AWS and Azure, respectively,

```
resource "aws_instance" "example" {
  ami = "ami-0123456789abcdef0"
  instance_type = "t2.micro"
}

resource "azurerm_virtual_machine" "example" {
  name = "example-vm"
  location = "eastus"
  size = "Standard_A1"
}
```

