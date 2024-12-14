generate "backend" {
  path      = "_backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    terraform {
      backend "s3" {
        region         = "us-east-2"
        dynamodb_table = "tf-state-${get_aws_account_id()}"
        bucket         = "tf-state-${get_aws_account_id()}-main"
        key            = "${path_relative_to_include()}/terraform.tfstate"
        encrypt        = true
      }
    }
    EOF
}