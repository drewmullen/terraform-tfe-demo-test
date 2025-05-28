# terraform test -filter="tests/1_project.tftest.hcl"

run "create_project" {
    command = apply

    assert {
      condition = tfe_project.test.name == "test"
      error_message = "Project ID should be 'test'"
    }
}