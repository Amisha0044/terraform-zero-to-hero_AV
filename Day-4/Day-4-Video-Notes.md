### terraform.tfstate
- State file is the heart of terraform as it records the info about the infrastructure it has created.
- It uses state file whenever we run terraform plan/apply or destroy; it checks the state file to see what infra it created and then compare it with provided tf infra file and compares whether it has to modify existing resource, create new or need to delete any resource.
- If there was no state file concept in TF, everytime it would have created new resource even if you want to modify existing and wouldn't be able to delete as it would have no track of what infra it created.
###
- 
