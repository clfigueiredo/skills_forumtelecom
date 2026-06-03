```markdown
# skills_forumtelecom Development Patterns

> Auto-generated skill from repository analysis

## Overview
This skill demonstrates TypeScript development patterns for the `skills_forumtelecom` repository. It covers file organization, code style, and testing conventions, equipping developers to contribute clean, consistent code. The repository does not use a formal framework, focusing on modular TypeScript with named exports and relative imports.

## Coding Conventions

### File Naming
- Use **camelCase** for file names.
  - Example: `userProfile.ts`, `messageHandler.ts`

### Import Style
- Always use **relative imports**.
  - Example:
    ```typescript
    import { sendMessage } from './messageHandler';
    ```

### Export Style
- Use **named exports** for all modules.
  - Example:
    ```typescript
    // In messageHandler.ts
    export function sendMessage(msg: string) { ... }
    ```

### Commit Messages
- No strict prefix; commit messages are freeform but concise (average 41 characters).

## Workflows

### Adding a New Module
**Trigger:** When you need to add new functionality.
**Command:** `/add-module`

1. Create a new `.ts` file using camelCase naming.
2. Implement your logic using named exports.
3. Import dependencies using relative paths.
4. Write corresponding test files as `*.test.ts`.
5. Commit your changes with a clear, concise message.

### Refactoring Existing Code
**Trigger:** When improving or updating existing logic.
**Command:** `/refactor-code`

1. Identify the module to refactor.
2. Update code, maintaining camelCase file names and named exports.
3. Adjust imports to remain relative.
4. Update or add tests as needed.
5. Commit with a descriptive message.

### Running Tests
**Trigger:** To verify code correctness after changes.
**Command:** `/run-tests`

1. Locate test files matching the `*.test.*` pattern.
2. Use the project's test runner (unspecified; check project docs or package.json).
3. Run all tests and review results.
4. Fix any failing tests before committing.

## Testing Patterns

- Test files are named with the pattern `*.test.*` (e.g., `userProfile.test.ts`).
- The testing framework is not specified; check for documentation or scripts in `package.json`.
- Tests should cover all exported functions and modules.

**Example:**
```typescript
// userProfile.test.ts
import { getUserProfile } from './userProfile';

test('should return user profile', () => {
  const profile = getUserProfile('user123');
  expect(profile.id).toBe('user123');
});
```

## Commands
| Command        | Purpose                                   |
|----------------|-------------------------------------------|
| /add-module    | Scaffold and add a new module             |
| /refactor-code | Refactor existing code                    |
| /run-tests     | Run all tests in the repository           |
```
