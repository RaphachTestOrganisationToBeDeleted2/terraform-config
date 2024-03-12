variable "group_name_pattern" {
  description = "Provide an array of Azure ID group patterns to be found. Ex: Example_1 will return all groups from Azure ID that follow that pattern."
  type = list(string)
  default = ["Example_1", "Example_2"]
}