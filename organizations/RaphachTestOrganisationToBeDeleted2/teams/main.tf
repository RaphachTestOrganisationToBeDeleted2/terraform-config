module "github_teams_setting" {
  source = "../../../modules/github-teams"
  pathToJson = "${path.root}/fetcher/parsedGroupsAndUsers.json"
}
