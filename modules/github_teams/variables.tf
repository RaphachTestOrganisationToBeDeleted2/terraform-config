variable pathToJson {
  type = string
  description = "value"
}

locals {
  teams_data = jsondecode(file("${var.pathToJson}"))
}

locals {
  unique_members = {for unique_members in local.user_team_memberships : unique_members.user_name => unique_members...}
}

# the variable is too deep to have Terraform handle the nested objects. So we preprocess it flatenning it first.
locals {
#   Create a flat list of all user-team memberships
    user_team_memberships = flatten([
        for team_name, users in local.teams_data : [
            for user_id, user_info in users : {
                team_name = team_name
                user_id = user_id
                user_name = user_info.name
                user_email = user_info.email
            }
        ]
    ])
}

# variable teams {
#     type = map(object({
#       users = map(object({
#         name = string
#         email = string
#       }))
#     }))
# }