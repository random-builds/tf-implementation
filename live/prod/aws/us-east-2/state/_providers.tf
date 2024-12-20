# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  required_version = "~> 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.81.0"
    }
  }
}
provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = { "Environment" : "Production", "ManagedBy" : "Terraform", "Owner" : "Operations", "Project" : "Infrastructure" }
  }
}
provider "aws" {
  alias  = "backup"
  region = "us-east-1"
  default_tags {
    tags = { "Environment" : "Production", "ManagedBy" : "Terraform", "Owner" : "Operations", "Project" : "Infrastructure" }
  }
}
provider "aws" {
  alias  = "primary"
  region = "us-east-2"
  default_tags {
    tags = { "Environment" : "Production", "ManagedBy" : "Terraform", "Owner" : "Operations", "Project" : "Infrastructure" }
  }
}
