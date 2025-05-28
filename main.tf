resource "tfe_organization" "test" {
  name  = var.organization_name
  email = var.email
}

resource "tfe_project" "test" {
  name         = "test"
  organization = tfe_organization.test.name
  description  = "Test project"
}