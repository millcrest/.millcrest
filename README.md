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