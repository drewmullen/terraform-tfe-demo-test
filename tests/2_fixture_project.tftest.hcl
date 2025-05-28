# terraform test -filter="tests/2_fixture_project.tftest.hcl"

run "setup_name" {
  command = apply

  module {
    source = "./tests/fixtures/random_string"
  }
}

run "create_projec_with_fixture" {
  command = apply

  variables {
    organization_name = run.setup_name.random_string
    email             = "${run.setup_name.random_string}@example.com"
  }

  assert {
    condition     = tfe_project.test.organization == run.setup_name.random_string
    error_message = "Organization name should match the random string"
  }
}