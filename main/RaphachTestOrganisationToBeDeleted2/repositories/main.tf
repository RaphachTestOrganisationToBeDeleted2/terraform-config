module "github_repository" {
  source = "../../../modules/github_repo"
  repository = {
    repo1 = {
      name        = "first-repo"
      description = "description for first repo"
    }
    repo2 = {
      name        = "second-repo"
      description = "description for second repo"
    }
  }
}

output "repo" {
  value = module.github_repository.full_name
}

output "url" {
  value = module.github_repository.repo_url
}