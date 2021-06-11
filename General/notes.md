- [testing](#testing-overview)

## Testing Overview

Sources:

- [dev.to Amplify](https://dev.to/rakannimer/testing-your-amplify-application-with-jest-and-cypress-1g0i?utm_source=dormosheio&utm_campaign=dormosheio#running-tests-from-the-amplify-console-on-every-commit)
- [Kent C. Dodds](https://kentcdodds.com/blog/static-vs-unit-vs-integration-vs-e2e-tests)

### Questions:

1.  What are four testing methods?
1.  Describe static testing.
1.  Describe unit testing.
1.  Describe integration testing.
1.  Describe end-to-end testing.
1.  Functional Testing is a name sometimes used for what kind of testing?
1.  What are the trade-offs for testing?

### Answers:

1.  Static Testing, Unit Testing, Integration Testing, End-to-End Testing.
1.  Static tests are not done by executing the code, but by reading it, parsing it, and trying to find problems with it. Static testing can be handled through services like ESLint, Prettier, and Typescript.
1.  Unit tests make sure that individual units of code, like functions, components, classes, etc, produce the right outputs (and effects) for a given input.
1.  Integration tests give us confidence that different units of code work together as we expect them to.
1.  End-To-End tests (e2e for short or functional testing) interact with our app as our end users would. Libraries like Cypress can be used to test in this format.
1.  End-To-End testing.
1.  **Cost**, the more comprehensive your tests the more expensive it becomes to maintain them. **Speed**, As you move up from static, unit, integration, e2e, the time it takes to run the tests will increase.
