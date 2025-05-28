# terraform test -filter="tests/4_example_project.tftest.hcl"

# relies on module outputs to check values

run "example_basic" {
    command = apply

    module {
      source = "./examples/basic"
    }

    variables {
      organization_name = "example_org_dmullen"
      email             = "test@example.com"
    }

    assert {
      condition = module.example_basic.tfe_project_name == "test"
      error_message = "Project ID should be 'test'"
    }
}