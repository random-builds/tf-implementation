include "backend" {
  path = find_in_parent_folders("aws-backend.hcl")
}

terraform {
  source = "github.com/random-builds/tf-module-keycloak.git//openid-client?ref=a3d652b9151aa76e5c7db7e2390222f55bdea739"
}

inputs = {
  realm_name = "onprem"
  client_name = "argo-cd"
  client_id = "argo-cd"
  valid_redirect_uris = [
    "https://argo-cd.trial.studio/auth/callback",
    "https://argo-cd.trial.studio/api/dex/callback",
    "http://localhost:8085/auth/callback"
  ]
}

dependencies {
  paths = ["../realm-onprem"]
}