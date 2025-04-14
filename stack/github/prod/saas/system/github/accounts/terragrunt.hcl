include "backend" {
  path = find_in_parent_folders("aws-backend.hcl")
}

terraform {
  source = "github.com/random-builds/tf-module-github.git//accounts?ref=2ce4f1e3e9b1541930c773137e9aea7523edb74c"
}

inputs = {
  teams = {
    "admin" = {
      maintainers = ["techtrials-github-admin"]
    }
    "devops" = {
      members = ["techtrials-github-user1"]
    }
    "domain1" = {
      members = ["techtrials-github-user2"]
    }
    "domain2" = {}
    "engineers" = {
      members = [
        "techtrials-github-user1",
        "techtrials-github-user2"
      ]
    }
  }
  members = {
    "techtrials-github-admin" = {
      role = "admin"
    }
    "techtrials-github-user1" = {}
    "techtrials-github-user2" = {}
  }
}
