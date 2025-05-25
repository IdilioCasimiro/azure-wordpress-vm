variable "location" {
  type    = string
  default = "West Europe"
}

variable "tags" {
  type = map(string)
  default = {
    "Environment" = "Terraform-Sandbox"
  }
}