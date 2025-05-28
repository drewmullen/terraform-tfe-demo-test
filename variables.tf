variable "email" {
  description = "org email"
  type        = string
}
variable "organization_name" {
  description = "Organization name"
  type        = string

  validation {
    condition     = var.organization_name != "drew"
    error_message = "value of organization_name must contain 'drew'"
  }
}