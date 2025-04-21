include "backend" {
  path = find_in_parent_folders("aws-backend.hcl")
}

terraform {
  source = "github.com/random-builds/tf-module-keycloak.git//accounts?ref=a3d652b9151aa76e5c7db7e2390222f55bdea739"
}

inputs = {
  realm_name = "onprem"
  groups = {
    "admin" = {
      members = ["techtrials-github-admin"]
    }
    "devops" = {
      members = ["techtrials-github-user1"]
    }
    "domain1" = {
      members = ["techtrials-github-user2"]
    }
    "domain2" = {}
    "engineers" = {
      members = ["techtrials-github-user1", "techtrials-github-user2"
      ]
    }
  }
  users = {
    techtrials-github-admin = {
      first_name = "admin"
      last_name  = "admin"
      email = "admin@admin.com"
    }
    techtrials-github-user1 = {
      first_name = "user1"
      last_name  = "user1"
      email = "user1@user1.com"
    }
    techtrials-github-user2 = {
      first_name = "user2"
      last_name  = "user2"
      email = "user2@user2.com"
    }
  }

}

dependencies {
  paths = ["../realm-onprem"]
}