output "full_name" {
  value = {for repo in github_repository.template_repo: repo.name => repo.full_name}
  description = "A string of the form 'orgname/reponame'."
}

output "repo_url" {
  value = {for repo in github_repository.template_repo: repo.name => repo.html_url}
}