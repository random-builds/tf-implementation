locals {
  path            = regex("(?P<platform>[^/]+)/(?P<environment>[^/]+)/(?P<location>[^/]+)/(?P<category>[^/]+)/(?P<project>[^/]+.*)", path_relative_to_include())
  common_name     = "${local.path.project}-${local.path.category}-${local.path.location}-${local.path.environment}"
  tags = {
    platform = local.path.platform
    environment = local.path.environment
    project       = local.path.project
    location      = local.path.location
    category = local.path.category
    code_location = get_path_from_repo_root()
    managed_by    = "terraform"
  }
}
