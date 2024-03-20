terraform {
  required_providers {
    aws = {
        source  = "hashicorp/aws"
    }
  }

  #Stores terraform tfstate file in S3 backend for security
  /*NOTE:A backend block cannot refer to named values (like input variables, locals, or data source attributes). 
  You can use a partial config & then pass them in using the -backend-config CLI argument:

  https://developer.hashicorp.com/terraform/language/settings/backends/configuration#partial-configuration
  */
  backend "s3" {

    #referencing bucket name from manually created s3 from AWs console
   /* Note:TERRAFORM is smart enough to create each backend for each respective backends under env:/ folder
     BUCKET NAME                   REGION
        zuvachy-terraform-backend    ap-south-1            */
     
    bucket = "zuvachy-terraform-backend"
    key = "terraform-backend/terraform.tfstate"
    region = "ap-south-1"

  }
}

# Provider region selection based on app requirement
# Workspace comcept is used
provider "aws" {
  region = lookup(var.app-region,terraform.workspace)

  alias = "myregion"
}

data "aws_region" "current" {
  provider = aws.myregion
}

output "ll" {
  value = data.aws_region.current.name
}


