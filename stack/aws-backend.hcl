locals {
  path = regex("(?P<provider>[^/]+)/(?P<environment>[^/]+)/(?P<location>[^/]+)/.*", path_relative_to_include())
  location = local.path.location
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    terraform {
      backend "s3" {
        region         = "us-east-2"
        bucket         = "tf-state-${get_aws_account_id()}-primary"
        key            = "${path_relative_to_include()}/terraform.tfstate"
        encrypt        = true
        use_lockfile   = true
      }
    }
    EOF
}