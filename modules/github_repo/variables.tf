variable "repository" {
    type = map(object({
        name = string
        description = string
    }))
}


# variable "repositoryName" {
#     description = "(Required) Name of the repository to be created"
#     type = string
# }

# variable "repositoryDescription" {
#     description = "(Optional) Description of the repository to be created"
#     type = string
#     default = ""
# }

# variable "repositoryVisibility" {
#     description = "(Optional) Visibility of the repository to be created: public, private or internal. Defaults to public for testing purposes."
#     type = string
#     default = "public"
# }

# variable "createTwinRepo" {
#     description = "(Optional) Setting this to true will create an .imp as well as a .cfg version of the repository"
#     type = bool
#     default = true
# }

