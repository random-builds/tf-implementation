locals {
  global_versions  = yamldecode(file(find_in_parent_folders("terraform-version.yaml")))
  default_tags     = yamldecode(file(find_in_parent_folders("default-tags.yaml")))
  environment_tags = yamldecode(file(find_in_parent_folders("environment-tags.yaml")))
  final_tags       = merge(local.default_tags, local.environment_tags)
}
include "backend" {
  path = find_in_parent_folders("aws-backend.hcl")
}

generate "provider" {
  path      = "_providers.tf"
  if_exists = "overwrite_terragrunt"
  contents = replace(templatefile(find_in_parent_folders("terraform-provider.tftpl"),
    merge(
      local.global_versions,
      {
        aws = merge(
          local.global_versions.aws,
          {
            enabled      = true
            region       = "us-east-2"
            default_tags = jsonencode(local.final_tags)
            aliases = {
              primary = {
                region       = "us-east-2"
                default_tags = jsonencode(local.final_tags)
              }
              backup = {
                region       = "us-east-1"
                default_tags = jsonencode(local.final_tags)
              }
            }
          }
        )
      }
    )
  ), "/(?m)(?s)(^[\r\n])/", "")
}

