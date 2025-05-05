-> Ex. to create s3 bucket - login to aws ocnsole, fill few details (like bucket name, versioning enable/disable, block public access) and bucket gets created (~ in 2 mins).
-> But what if the request is to create 100 buckets for different teams; that means it'll take 2x100 = 200 mins (manual, repeatitive work).
-> An efficient way to deal with this situation is to do it programmatically (CLI or API(Python Boto3)), but many devops engineers or cloud enginners are not proficient/comfirtable with coding.
-> So, AWS introduced AWS CLOUDFORMATION to create and manage infra as code on AWS, where templates are written in JSON/YAML which almost all cloud/devops engineers are familiar with as input and outputs of requests are in this format only.
-> But this works only on AWS, but what if we have multi cloud environment, then we'll need to learn multiple such tools for each cloud provider; so TERRAFORM was introduced which supports multi-cloud infra creation and management.

-> Different IaC Tools: (to create highly available and scalable infra efficiently)
  AWS - AWS CloudFormation
  AZURE - Azure Resource Manager
  OpenStack - Heat Template
  Any environment (multi-cloud support) - TERRAFORM  -->  Universal Approach [largest market due to simplicity, multi-cloud support]

-> HCL (HashiCorp Language)- Terraform templating language

-> Terraform uses "API-AS-CODE" concept internally, so it directly talks to provider's API.
  If you have written code defininf aws as provider, your terraform/HCL code gets converted into AWS APIs and same with Azure and others.

-> Terraform has a good and large community support.
