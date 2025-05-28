# terraform test -filter="tests/3_mock_project.tftest.hcl"

override_resource {
  target = random_pet.name
  values = {
    id = "test-random"
  }
}

run "setup_name_mocked" {
  command = apply

  module {
    source = "./tests/fixtures/random_string"
  }
}

# mocks value from random provider
# creates org & project using mocked value name

run "create_project_with_mock" {
  command = apply

  variables {
    organization_name = run.setup_name_mocked.random_string
    email             = "${run.setup_name_mocked.random_string}@example.com"
  }

  assert {
    condition     = tfe_project.test.organization == "test-random"
    error_message = "Organization name should match the random string"
  }
}