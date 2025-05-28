Overview
- intended for module producers
- modules are contracts (like APIs)
	- inputs / outputs
	- resources

Language
- `run`: individual tests run sequentially steps that make up a test file 
- `assert`: a condition evaluates an expression to determine the success or failure of the test. evaluating to `true` = success, `false` = fail
- `expect_failures`: instructs test run to expect failure and list value contains reason why
- 

Dir structure
- root dir
- `tests` dir
- `-test-directory=path/to/tests`

Examples
- 1 basic
	- 2 tests
	- test file levels vars vs run level vars
	- assert
	- expect_failures
- 2 fixtures
	- fixture explanation
	- `module {}` which communicate using `outputs`
	- setup_name explanation
	- idea is to pass a generated value to be used in another 
	- checking that project org (which is set from org resource) matches generated value
- 3 mock
	- mocking conceptual overview
	- overriding resource from setup module call
	- tests runs can still reference prior run blocks
- 4 examples
	- meat of testing modules is testing examples
	- reference via module call
	- values passed back via example outputs.tf
	- requires "../.."

Integration
- use CI
- `-cloud-run` is available
	- setup in registry
	- set auth values

### References

- https://github.com/aws-ia/terraform-aws-vpc/blob/main/tests/examples_public_private.tftest.hcl
- https://developer.hashicorp.com/terraform/language/tests/mocking
- https://developer.hashicorp.com/terraform/language/tests
- https://mattias.engineer/blog/2023/terraform-testing-deep-dive/