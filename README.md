# .millcrest

## Principles of Software Development

We're here to build awesome software, and build it fast. These principles are our roadmap to creating high-quality, efficient products that make a real impact. They're designed to keep our team aligned, our code clean, and our deployment pipeline smooth. By sticking to these guidelines, we ensure we're always ready to ship, iterate quickly, and stay ahead of the curve. Let's write some great code.

# General Software Development Principles

1. **Don't merge unfinished work.** Polish as you go. Every commit should be potentially shippable. Refine features incrementally and integrate them only when they're complete. Avoid the trap of planning future "polish phases." They often never happen.

2. **Easy Spin Up** It's critical that projects are as easy to spin up as possible. Bulletproof your dev by providing default configurations. Spend the time documenting spin up steps.

3. **Keep your code simple.** Constantly review your functions and challenge yourself to simplify further. Resist the urge to create needless abstractions. Solve the problem at hand directly, rather than building elaborate frameworks for hypothetical future needs. Simplicity is the ultimate sophistication. Future comprehension depends on it.

4. **Great tools help make great software.** Invest time in building and mastering tools that enhance your development process. This includes everything from IDE configurations and build scripts to testing frameworks, code generation, and deployment pipelines. Automate repetitive tasks. The effort spent on tooling pays off in increased productivity, consistency, and code quality.

5. **We are our own best testing team and should never allow anyone else to experience bugs or see the software crash.** Don't waste others' time. Test thoroughly before committing your code. Every path way should be road tested by you before submitting a PR.

6. **As soon as you see a bug, fix it.** Stop what you're working on and fix it straight away. If you don't fix bugs your new code will be built on a buggy codebase and ensure an unstable foundation.

7. **Write your code for this project only - not for a future project.** You're not going to reuse this code. Who are you trying to kid? In the future, you'll write new code because you'll be smarter.

8. **Make error messages clear, actionable, and traceable.** Error messages should clearly explain what went wrong and, when possible, how to fix it. Include relevant error codes, stack traces, or log references to aid in debugging. Remember, good error messages are not just for users – they're invaluable for developers during troubleshooting. An informative error message can save hours of debugging time.

9. **Code transparently.** Tell your lead and peers exactly how you are going to solve your current task and get feedback and advice. Do not treat software development like each coder is a black box.

10. **Programming is a creative art form based in logic.** Every programmer is different and will code differently. It's the output that matters. Embrace diverse coding styles and approaches, as long as they produce high-quality, maintainable code that meets requirements.


---

> *Acknowledgment: These principles draw significant inspiration from and pay homage to the software development philosophy of id Software, particularly the principles employed during the development of Doom. Millcrest has adapted and expanded upon their approach to suit modern, general software development needs while maintaining the spirit of pragmatism, efficiency, and excellence that characterised id Software's groundbreaking work.*

---

# Development Design Rules

This document outlines the coding standards and best practices for our project. These rules ensure consistency across our codebase and improve maintainability.

## Frontend (React & TypeScript)

### Tailwind CSS
- Use lowercase for all Tailwind classes
- Use hyphens (-) to separate words in class names, not underscores (_)
- Example: `className="text-lg font-bold text-blue-500"`

### React
- Use functional components with hooks instead of class components
- Use PascalCase for component names
- Use camelCase for prop names
- Prefer destructuring for props
- Example:
  ```tsx
  const UserProfile: React.FC<UserProfileProps> = ({ name, age }) => {
    // ...
  }
  ```

### TypeScript
- Use interfaces for object shapes, especially for component props
- Use type for unions, intersections, and simple types
- Use PascalCase for type and interface names
- Example:
  ```typescript
  interface UserData {
    id: number;
    name: string;
    email: string;
  }

  type Status = 'active' | 'inactive' | 'pending';
  ```

---

## Python

### General
- Fight the urge to abstract to classes / shared libraries
- Import numpy as np > from numpy import sum
- Use the linters: Ruff
- Abstracting for code simplicity still good
- Use Jupyter Notebooks
- Follow the [PEP 8](https://www.python.org/dev/peps/pep-0008/) style guide for Python code
- Use meaningful variable names in snake_case
- Use PascalCase for class names
- Use UPPERCASE for constants

### Code Structure
- Embrace Python's simplicity. Use built-in data structures like lists, dictionaries, and sets
- Avoid creating classes for simple data containers when a dictionary or named tuple will suffice
- Favor composition over inheritance
- Keep functions and methods small and focused on a single task

### Python Features
- Use list comprehensions and generator expressions judiciously. Prioritise readability
- Leverage Python's standard library before adding external dependencies
- Use context managers (with statements) for resource management
- Use decorators where they simplify code
- Be cautious with metaprogramming features like metaclasses and descriptors

### Type Hints
- Use type hints in larger projects to improve readability and catch errors early
- Consider using a static type checker like mypy

### Performance
- Write clear, correct code first. Profile before optimising
- Remember: premature optimisation is the root of all evil

### Dependencies
- Use virtual environments to isolate project dependencies
- Maintain a requirements.txt or Pipfile to specify exact versions of dependencies

### Example
```python
from typing import List, Dict

def process_user_data(users: List[Dict[str, str]]) -> List[str]:
    """
    Process user data and return a list of usernames.
    """
    return [user['username'] for user in users if 'username' in user]

# Usage
user_data = [{'username': 'alice'}, {'email': 'bob@example.com'}, {'username': 'charlie'}]
usernames = process_user_data(user_data)
```

## General Practices

[Existing general practices remain as they are]

- Avoid unnecessary abstractions. Keep your code straightforward and direct, especially in Python

Remember to keep this document updated as our practices evolve. Regular team discussions on these rules will help ensure everyone is aligned and can contribute to improving our development process.

---

## Go

### General
- Follow the [Effective Go](https://golang.org/doc/effective_go) guidelines
- Use `gofmt` to format your code
- Use meaningful variable names in camelCase
- Use PascalCase for exported functions and types

### SQLC
- Keep SQL queries in separate `.sql` files
- Use meaningful names for queries, prefixed with the operation type (e.g., `GetUser`, `CreatePost`)
- Example:
  ```sql
  -- name: GetUserByID :one
  SELECT * FROM users WHERE id = $1;
  ```

### Bob (Dynamic Query Building)
- Use consistent naming conventions for query builders
- Prefer method chaining for readability
- Example:
  ```go
  query := bob.Select("id", "name").
    From("users").
    Where("age > ?", 18).
    OrderBy("name ASC")
  ```

## API (ConnectRPC & Protocol Buffers)

### Protocol Buffers
- Use PascalCase for message and service names
- Use snake_case for field names
- Version your proto files (e.g., `user_service_v1.proto`)
- Example:
  ```protobuf
  syntax = "proto3";

  message UserProfile {
    int32 user_id = 1;
    string full_name = 2;
    string email_address = 3;
  }
  ```

## General Practices

- Write clear and concise comments for complex logic
- Maintain up-to-date documentation
- Use meaningful commit messages following [Conventional Commits](https://www.conventionalcommits.org/)
- Conduct code reviews for all changes
- Write unit tests for new features and bug fixes

Remember to keep this document updated as our practices evolve. Regular team discussions on these rules will help ensure everyone is aligned and can contribute to improving our development process.
