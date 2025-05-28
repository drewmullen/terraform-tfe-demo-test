# terraform test -filter="tests/1_project.tftest.hcl"

# passed to every run
variables {
  email = "test_1_project@example.com"
}

run "create_project" {
  command = apply

  # scoped to embedded run
  variables {
    organization_name = "test_1_project"
  }

  assert {
    condition     = tfe_project.test.name == "test"
    error_message = "Project ID should be 'test'"
  }
}

run "create_project_failure" {
  # expect_failures only work with plan
  command = plan

  variables {
    organization_name = "drew"
  }

  expect_failures = [
    var.organization_name
  ]
}