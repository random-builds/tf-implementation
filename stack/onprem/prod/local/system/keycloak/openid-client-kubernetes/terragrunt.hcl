include "backend" {
  path = find_in_parent_folders("aws-backend.hcl")
}

terraform {
  source = "github.com/random-builds/tf-module-keycloak.git//openid-client?ref=35b56b0639ef5680fa69f93832b7107ea10a7b6f"
}

inputs = {
  realm_name = "onprem"
  client_name = "kubernetes"
  client_id = "kubernetes"
  valid_redirect_uris = [""]
}
