

###############################################################
# AWS instance ami selection based on user's selected region  #
# Used data sourcing concept of Terraform                     #
###############################################################
data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "zuvachy-server-ec2" {
   ami = data.aws_ami.app_ami.id
   instance_type = "t2.micro"

   tags = {
      Name = "ec2-zuvachy-server-testing"
      
          }
}

# Output value passing AMI ID selected value to output value in main.tf
output "ami-selected" {
  value = aws_instance.zuvachy-server-ec2.ami
}

