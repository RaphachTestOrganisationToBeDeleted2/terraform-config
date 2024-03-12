locals {
  group_name_pattern = var.group_name_pattern
}

data "azuread_groups" "groups_of_interest" {
  display_name_prefix = local.group_name_pattern
}

locals {
  array_of_group_matching_pattern = zipmap(data.azuread_groups.groups_of_interest.display_names, data.azuread_groups.groups_of_interest.object_ids)
}


data "azuread_group" "extract_members_list" {
  for_each = local.array_of_group_matching_pattern
  object_id = each.value
}

locals {
  array_of_member_ids = {for id, group in data.azuread_group.extract_members_list: id => group.members}
}

data "azuread_users" "upn_of_users" {
  for_each = local.array_of_member_ids
    object_ids = each.value
}

locals {
  array_of_upns = {for id, user in data.azuread_users.upn_of_users: id => user.user_principal_name}
}

# only outputs in the required shape for other modules.
# output "teams_data" {
#   value = { for group_name, group_id in local.array_of_group_matching_pattern :
#     group_name => {
#       "name" = group_name,
#       "members" = [for member_id in local.array_of_member_ids[group_name] : local.array_of_upns[member_id]]
#     }
#   }
# }

resource "local_file" "team_json_file" {
  content = templatefile("${path.module}/teams.tpl", {
    teams = local.array_of_group_matching_pattern,
    members = local.array_of_member_ids,
    upns = local.array_of_upns,
  })
  filename = "${path.module}/teams.json"
}