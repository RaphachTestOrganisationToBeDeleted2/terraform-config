variable "billing_email" {
  description = "(Required) The billing email of the organization"
}

variable "blog_name" {
    description = "(Optional) The blog URL for the organization."
    default = ""
}

variable "email" {
    description = "(Optional) The email address for the organization."
    default = ""
}

variable "twitter_username" {
    description = "(Optional) The Twitter username for the organization."
    default = ""
}

variable "location" {
    description = "(Optional) The location for the organization."
    default = ""
}

variable "company_name" {
    description = "(Optional) The name of the Company owning the organization"
    default = ""
}

variable "organization_name" {
  description = "(Required) The name of the organization that will have its settings adjusted to default"
}

variable "organization_description" {
    description = "(Optional) The description for the organization."
    default = ""
}