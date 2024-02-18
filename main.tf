


module "github_repository" {
  source = "./modules/github-repo"
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

module "githubOrgSetting" {
  source            = "./modules/github-org"
  organization_name = "RaphachTestOrganisationToBeDeleted2"
  billing_email     = "raphaelhaasper@gmail.com"
}


module "github_teams_setting" {
  source = "./modules/github-teams"
  pathToJson = "${path.root}/fetcher/parsedGroupsAndUsers.json"
}

output "repo" {
  value = module.github_repository.full_name
}

output "url" {
  value = module.github_repository.repo_url
}