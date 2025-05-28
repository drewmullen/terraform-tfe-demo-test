# terraform test -filter="tests/1_project.tftest.hcl"

variables {
  # passed to every run
  email = "test_1_project@example.com"
}

run "create_project" {
    command = apply

    variables {
      # scoped to embedded run
      organization_name = "test_1_project"
    }

    assert {
      condition = tfe_project.test.name == "test"
      error_message = "Project ID should be 'test'"
    }
}

run "create_project_failure" {
    command = plan # expect_failures only work with plan

    variables {
      organization_name = "drew"
    }

    expect_failures = [ 
      var.organization_name
    ]
}