resource "local_file" "pet" {
  filename        = "pets.txt"
  content         = "Dogs,cats are pet! "
  file_permission = "0770"
}

resource "random_pet" "my_pet" {
  prefix    = "Mrs"
  separator = "."
  length    = 1
}

/*

C:\Users\varad_ahirwadkar\Desktop\Terraform\Demo 1>terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/local from the dependency lock file
- Reusing previous version of hashicorp/random from the dependency lock file
- Using previously-installed hashicorp/local v2.1.0
- Using previously-installed hashicorp/random v3.1.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

C:\Users\varad_ahirwadkar\Desktop\Terraform\Demo 1>terraform plan
local_file.pet: Refreshing state... [id=3860fcf56ec066b92b5c2959b03c789dc9b47e74]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # random_pet.my_pet will be created
  + resource "random_pet" "my_pet" {
      + id        = (known after apply)
      + length    = 1
      + prefix    = "Mrs"
      + separator = "."
    }

Plan: 1 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

C:\Users\varad_ahirwadkar\Desktop\Terraform\Demo 1>terraform apply
local_file.pet: Refreshing state... [id=3860fcf56ec066b92b5c2959b03c789dc9b47e74]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # random_pet.my_pet will be created
  + resource "random_pet" "my_pet" {
      + id        = (known after apply)
      + length    = 1
      + prefix    = "Mrs"
      + separator = "."
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

random_pet.my_pet: Creating...
random_pet.my_pet: Creation complete after 0s [id=Mrs.ibex]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

C:\Users\varad_ahirwadkar\Desktop\Terraform\Demo 1>

*/