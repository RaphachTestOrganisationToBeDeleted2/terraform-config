# locals {
#   visibility             = var.repositoryVisibility == null ? lookup(var.defaults, "visibility", local.private_visibility) : var.visibility
# }


resource "github_repository" "template_repo" {
    for_each = var.repository
    name = each.value.name
    description = each.value.description
    visibility = "public"
    has_issues = false
    has_discussions = false
    has_projects = false
    has_wiki = false
    is_template = true
    allow_merge_commit = true
    allow_squash_merge = false
    allow_rebase_merge = false
    allow_auto_merge = false
    merge_commit_title = "PR_TITLE"
    merge_commit_message = "PR_BODY"
    delete_branch_on_merge = false
    # web_commit_signoff_required = false
    has_downloads = false
    auto_init = true
    gitignore_template = "Haskell"
    archived = false
    archive_on_destroy = false
    allow_update_branch = true
    vulnerability_alerts = true
}


resource "github_branch_default" "default_repository_branch" {
  for_each = var.repository
  repository = github_repository.template_repo[each.key].name
  branch     = "master"
  rename     = true
  depends_on = [github_repository.template_repo]
}

resource "github_branch_protection" "branch_master_protection" {
  for_each = var.repository
  repository_id = github_repository.template_repo[each.key].name
  # also accepts repository name
  # repository_id  = github_repository.example.name

  pattern          = "master"
  enforce_admins   = true
  allows_deletions = false
  allows_force_pushes = false
  lock_branch = false
  require_signed_commits = true
  require_conversation_resolution = false

  depends_on = [ github_branch_default.default_repository_branch ]
  


#   require_status_checks {
#   }

  

  required_pull_request_reviews {
    dismiss_stale_reviews  = false
    restrict_dismissals    = true
    require_code_owner_reviews = true
    required_approving_review_count = 1
    require_last_push_approval = false
  }

#   restrict_pushes {
    
#   }

  force_push_bypassers = [
    
  ]

}





