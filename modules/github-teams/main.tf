# the incoming variable is enough to create teams
resource "github_team" "github_team" {
    for_each = local.teams_data

    name = each.key
    description = "Team managed by Terraform"
    privacy = "closed"
    # parent_team_id = 1
    # ldap_dn = "(Optional) The LDAP Distinguished Name of the group where membership will be synchronized. Only available in GitHub Enterprise Server."
    create_default_maintainer = false // (Optional) Adds a default maintainer to the team. Defaults to false and adds the creating user to the team when true.
}

resource "github_membership" "user_membership" {
    for_each = local.unique_members

    username = each.key
    role = "member" // must be of member or admin(admin called owner on UI)
    downgrade_on_destroy = false // (Optional) Defaults to false. If set to true, when this resource is destroyed, the member will not be removed from the organization. Instead, the member's role will be downgraded to 'member'.
}

resource "github_team_membership" "team_membership" {
    for_each = {for idx, um in local.user_team_memberships : "${um.team_name}-${um.user_id}" => um}

    team_id =  github_team.github_team[each.value.team_name].id
    username = each.value.user_name
    role = "member" // (Optional) The role of the user within the team. Must be one of member or maintainer. Defaults to member
}