include "backend" {
  path = find_in_parent_folders("aws-backend.hcl")
}

terraform {
  source = "github.com/random-builds/tf-module-keycloak.git//openid-client?ref=8ceaef8639165bad2b390876cec4c5afddde2c7f"
}

inputs = {
  realm_name = "onprem"
  client_name = "headlamp"
  client_id = "headlamp"
  valid_redirect_uris = [""]
}
