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

###
- terraform show 
  --> this command is used to display the current Terraform state in a human-readable format.
  --> ✅ What it does:
         o It reads the current state from terraform.tfstate (by default).
         o Displays all resources, their attributes, and values managed by Terraform.
  --> ✅ Useful Options:
         o terraform show -json: Outputs the state in JSON format (for scripting, automation, or tools).
         o terraform show path/to/terraform.tfstate: Show a specific state file.
        
- terraform init
  --> this command is the first command you run when starting a new Terraform project. It initializes your working directory for Terraform use.
  --> ✅ What terraform init does:
         o Downloads the provider plugins (e.g., AWS, Azure, etc.)
         o Initializes the backend (for storing state remotely, if configured)
         o Sets up .terraform/ directory
         o Validates the configuration structure
        You must run this inside a directory that contains Terraform configuration files (.tf files).
  --> ✅ Syntax:  terraform plan
  --> ✅ Sample Output:
            Initializing the backend...
            Initializing provider plugins...
            - Finding latest version of hashicorp/aws...
            - Installing hashicorp/aws v5.0.0...
            - Installed hashicorp/aws v5.0.0 (signed by HashiCorp)
            Terraform has been successfully initialized!
  --> ✅ When to run it:
         o First time in a new Terraform project
         o After adding or updating providers in .tf files
         o After cloning someone else's Terraform repo
  --> After running this command, it creates .terraform/ and .terraform.lock.hcl hidden folder and file respectively.

- terraform plan 
  --> this command is used to preview the changes Terraform will make to your infrastructure before actually applying them.
  --> ✅ Purpose:
         o It shows what will be:  Added, Changed and Destroyed
         o This helps you review and verify what Terraform will do, without making any real changes yet.
  --> ✅ Syntax:  terraform plan
  --> ✅ Optional:  terraform plan -out=tfplan  # Save the plan to a file
          Later you can apply it with:  terraform apply tfplan
  --> ✅ Example Output:
            Terraform will perform the following actions:
            # aws_instance.example will be created
            + resource "aws_instance" "example" {
                + ami           = "ami-0c55b159cbfafe1f0"
                + instance_type = "t2.micro"
                + tags          = {
                    + "Name" = "example"
                    }
                }
            Plan: 1 to add, 0 to change, 0 to destroy.
  --> ✅ When to run:
        o After editing .tf files to check your changes
        o Before terraform apply to avoid surprises

- terraform apply
  --> this command is used to execute the changes required to reach the desired infrastructure state defined in your .tf files.
  --> ✅ What it does:
        o Plans the changes (like terraform plan)
        o Prompts for confirmation
        o Applies the changes to your cloud provider (e.g., AWS, Azure, GCP)
  --> ✅ Syntax:  terraform apply
  --> ✅ Optional (auto-approve, skip prompt):  terraform apply -auto-approve
  --> ✅ After Running thie command:
        o It will create the file named terraform.tfstate, and save the state in this file
        o You can then inspect with terraform show
