include "backend" {
  path = find_in_parent_folders("aws-backend.hcl")
}

terraform {
  source = "github.com/random-builds/tf-module-github.git//repository?ref=d3e525e0aa0f11487cc0bbddeb07ca3388cdfe84"
}

inputs = {
  name = "tf-implementation"
  visibility = "public"
  team_collaborators = {
    admin = ["admin"]
    maintain = ["devops"]
    pull = ["engineers"]
  }
}