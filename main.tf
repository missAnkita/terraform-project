#####################################################################################################
#                                          TERRAFORM MAIN                                           #
# Note: Terraform workspace concept is used, Below is the menu and is available in variables.tf     # 
#       source code file:                                                                           #
#       WORKSPACE NAME       |  VALUE                                                               #
#       default              |  "ap-south-1"                                                        #
#       game_launch_region   |  "us-east-1"                                                         #
#       ngnix_server_region  |  "eu-west-1"                                                         #
#####################################################################################################

module "my-zuvacy-server" {
  source = "./modules/ec2"
}

# module "my-s3-backend-store" {
#   source = "./modules/s3"
# }

# module "myVPC" {
#   source = "./modules/vpc"
# }


# Output value displaying AMI ID received from output value from modules/ec2/ec2.tf file
output "ami-selected" {
  value = module.my-zuvacy-server.ami-selected
}




