include "backend" {
  path = find_in_parent_folders("aws-backend.hcl")
}

terraform {
  source = "github.com/random-builds/tf-module-keycloak.git//openid-client?ref=a3d652b9151aa76e5c7db7e2390222f55bdea739"
}

inputs = {
  realm_name = "onprem"
  client_name = "grafana"
  client_id = "grafana"
  valid_redirect_uris = ["https://grafana.trial.studio/login/generic_oauth"]
}

dependencies {
  paths = ["../realm-onprem"]
}