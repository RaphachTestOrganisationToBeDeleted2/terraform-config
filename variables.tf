variable "organization" {
  description = "name of the organisation to be managed"
  type        = string
  default     = "RaphachTestOrganisationToBeDeleted2"
}

variable "github_token" {
  type = string
  description = "Sets the GITHUB_TOKEN for terraform usage."
}