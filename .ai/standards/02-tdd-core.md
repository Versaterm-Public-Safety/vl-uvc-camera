# Test-Driven Development Standard

## TDD Workflow

1. **Write a failing test** that describes the desired behavior
2. **Run the test** — confirm it fails for the right reason
3. **Write minimal code** to make the test pass
4. **Run the test** — confirm it passes
5. **Refactor** if needed, re-run tests
6. **Commit**

Never write implementation code without a failing test first.

## Test Locations

[TODO: Define the test locations for this project. Examples:]

<!--
Common patterns:
- Python: tests/unit/, tests/integration/
- JavaScript/TypeScript: __tests__/, e2e/, e2e/regression/
- Go: *_test.go alongside source files
- Rust: tests/ for integration, #[cfg(test)] mod tests for unit
- Java: src/test/java/
-->

## Test Commands

[TODO: Add the test commands for this project. Examples:]

<!--
```bash
# Run all tests
# [your command here]

# Run a specific test
# [your command here]

# Run with coverage
# [your command here]

# Run E2E tests
# [your command here]
```
-->

## Naming Conventions

Use descriptive test names that explain behavior, not implementation:

- **Python (pytest)**: `test_<behavior>_<scenario>` (e.g., `test_create_item_missing_field_returns_400`)
- **JavaScript/TypeScript**: `describe("Component")` / `it("should do X when Y")`
- **Go**: `Test<Function>_<scenario>` (e.g., `TestCreateItem_MissingField`)

The pattern is always: **what** is being tested + **under what condition** + **expected outcome**.

## Patterns & Best Practices

- **Unit tests**: Mock external dependencies (databases, external APIs, file systems). Test one unit of behavior in isolation.
- **Integration tests**: Use real dependencies (test database, actual service calls). Test that components work together correctly.
- **E2E tests**: Test complete user workflows through the real UI or API.
- **Regression tests**: Reproduce a specific bug before the fix. Ensures the bug cannot recur.
- **Test behavior, not implementation**: Tests should survive refactors. Don't test private methods or internal state.

## Coverage Expectations

- New features: Tests required for all business logic
- Bug fixes: Regression test required that reproduces the bug
- Refactors: Existing tests must continue to pass

## CI Integration

[TODO: Describe your CI test integration. Example:]

<!--
All tests run in [CI system] on every push/PR. PRs cannot merge with failing tests.
-->
