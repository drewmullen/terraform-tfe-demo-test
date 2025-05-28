# Terraform Test Demo

Executing individual tests:
```shell
terraform test -filter="tests/1_project.tftest.hcl"
```

Resources Referenced as part of demo development:
- https://github.com/aws-ia/terraform-aws-vpc/blob/main/tests/
- https://developer.hashicorp.com/terraform/language/tests/mocking
- https://developer.hashicorp.com/terraform/language/tests