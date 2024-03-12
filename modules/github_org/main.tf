resource "github_organization_settings" "defaul_org_settings" {
    billing_email = var.billing_email
    company = var.company_name
    blog = var.blog_name
    email = var.email
    twitter_username = var.twitter_username
    location = var.location
    name = var.organization_name
    description = var.organization_description
    has_organization_projects = false
    has_repository_projects = false
    default_repository_permission = "read"
    members_can_create_repositories = false
    members_can_create_public_repositories = false
    members_can_create_private_repositories = false
    members_can_create_internal_repositories = false
    members_can_create_pages = false
    members_can_create_public_pages = false
    members_can_create_private_pages = false
    members_can_fork_private_repositories = false
    web_commit_signoff_required = false
    # turn these back on for GHE
    advanced_security_enabled_for_new_repositories = false
    dependabot_alerts_enabled_for_new_repositories=  false
    dependabot_security_updates_enabled_for_new_repositories = false
    dependency_graph_enabled_for_new_repositories = false
    secret_scanning_enabled_for_new_repositories = false
    secret_scanning_push_protection_enabled_for_new_repositories = false
}   

# resource "github_organization_ruleset" "master_branch_protection" {
#   name        = "Master Branch Protection"
#   target      = "branch"
#   enforcement = "active"

#   conditions {
#     repository_name {
#       exclude = [  ]
#       include = ["~ALL"]
#     }
#     ref_name {
#       include = ["master"] # Target the master branch specifically
#       exclude = []         # No branches are excluded from this rule
#     }
#   }

# #   bypass_actors {
# #     actor_id = 12345 //ID of team
# #     actor_type = "Team"
# #     bypass_mode = "pull_request"
# #     organi
# #   }

#   rules {
#     creation                = false # This setting might not apply directly to branch protection but rather to branch creation rules.
#     deletion                = false # Protect the master branch from being deleted.
#     non_fast_forward = true
#     required_linear_history = true  # Enforce a linear commit history on the master branch.
#     required_signatures     = false  # Require all commits to the master branch to be signed.
#     update                  = true  # Enforce rules on branch updates.

#     branch_name_pattern {
#         operator = "starts_with"
#         pattern = "master"
#         name = "Master Branch Protection. Organizational level."
#     }
#     pull_request {
#       dismiss_stale_reviews_on_push = false
#       require_code_owner_review = false //false for testing purposes. Should be true in live.
#       require_last_push_approval = false //IMO should be true live, so who pushes cannot review. Preserves 4 eyes principle.
#       required_approving_review_count = 0 //0 for test, should be one on live: 4 eyes.
#       required_review_thread_resolution = false 
#     }
#     # required_status_checks {
#     #     required_check {
#     #       context = "name of context" // (Required) (String) The status check context name that must be present on the commit.
#     #       integration_id = 12345 // (Optional) (Number) The optional integration ID that this status check must originate from.
#     #     }
#     #     strict_required_status_checks_policy = false //(Optional) (Boolean) Whether pull requests targeting a matching branch must be tested with the latest code. 
#     #                                                 //This setting will not take effect unless at least one status check is enabled. Defaults to false. IMO should be true to Master on live.
#     # }
#     # required_workflows {
#     #   required_workflow {
#     #     repository_id = 12354 // (Required) (Number) The ID of the repository. Names, full names and repository URLs are not supported.
#     #     path = "path_to_yaml" //  (Required) (String) The path to the YAML definition file of the workflow.
#     #     ref = "ref_to_workflow" // (Optional) (String) The optional ref from which to fetch the workflow. Defaults to master.
#     #   }
#     # }
#   }
# }
