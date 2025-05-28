module "example_basic" {
  source = "../.."

  organization_name = var.organization_name
  email             = var.email
}

variable "organization_name" {}
variable "email" {}