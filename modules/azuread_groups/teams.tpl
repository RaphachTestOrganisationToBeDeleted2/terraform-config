{
  "teams": [
    %{ for group_name, group_id in teams }
    {
      "name": "${group_name}",
      "members": [
        %{ for member_id in members[group_name] }
        "${upns[member_id]}"
        %{ endfor %}
      ]
    },
    %{ endfor %}
  ]
}

