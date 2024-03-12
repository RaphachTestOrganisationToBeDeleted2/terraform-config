provider "github" {
  owner = "RaphachTestOrganisationToBeDeleted2"
  token = var.github_token
}

provider "aws" {
  region = "eu-central-1"
}