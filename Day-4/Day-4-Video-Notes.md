### terraform.tfstate
- State file is the heart of terraform as it records the info about the infrastructure it has created.
- It uses state file whenever we run terraform plan/apply or destroy; it checks the state file to see what infra it created and then compare it with provided tf infra file and compares whether it has to modify existing resource, create new or need to delete any resource.
- If there was no state file concept in TF, everytime it would have created new resource even if you want to modify existing and wouldn't be able to delete as it would have no track of what infra it created.
###
- As state file contains each and every detail of all the resources it creates, it may contain sesitive info like secrets, API keys and passwords which we never want to reveal to other people even in the team.
- But if for collaboration and version control, whole project is uploaded on VCS including statefile, anyone having access to that github can view/access the state file.
- Also, if team is working on same infra, on emember cloned repo in his local, making changes but not yet commited and at the same time, other person cloned the repo, made some changes and pushed it back to github. Now when 1st member commit the changes and push to github, the changes 2nd person pushed, will be removed as statefile versions are not same in local of both members.
- Or if 1st member just mage code changes but didn't executed/applied it; then state file will not be updated as infra is not updated but when 2nd member sees the code he will think, changes are done but in reality, it's not. So, whoever is updating the code, have to execute it as well to get the infra changes executed and recorded in the state file.
###
- Solution to above drawbacks are using remote backend (S3) to host/store the state file.
- When we run terraform init, it checks terraform configurations like provider, region, version and remote backend and understands that remote backend is setup as S3 so state file is on mentioned S3. Hence, whenever terraform apply command is executed, it automatically updates the state file stored in S3 remote backend.
- So, the devops team haviing a github repo for terraform projects, will clone the github repo in their local, change the logic, execute terraform apply (and terraform automaticlaly updates the state file in S3 bucket), and push code from local to github repo again (with pull request).
