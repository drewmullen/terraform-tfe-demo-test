resource "random_pet" "name" {
  length    = 2
  separator = "-"
}

output "random_string" {
  value = random_pet.name.id
}