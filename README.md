# React + TypeScript + Vite + Eslint + Postcss + Prettier + Husky + Concurrently + Chokidar CLI

This template provides a comprehensive setup for a team to work on a React project with a consistent code base, and dockerize for production.

## Why We Need These Tools?

### These tools streamline our development process, automate routine tasks, and ensure our code is both high-quality and consistent.

### PostCSS

[PostCSS](https://www.npmjs.com/package/postcss) automates CSS operations and lets us use futuristic CSS features today. It helps keep our stylesheets easy to manage and update.

### Prettier

[Prettier](https://www.npmjs.com/package/prettier) automatically formats our code, ensuring it looks consistent and neat. This reduces time spent on styling code manually and helps avoid formatting errors.

### Husky

- [Husky](https://www.npmjs.com/package/husky) uses pre-commit hooks to run tasks like linting and testing automatically. This catches issues early and keeps our codebase clean.
- We will only lint staged files before committing to git. There is a script to handle this logic in ./husky/pre-commit without using [Lint-staged](https://www.npmjs.com/package/lint-staged). Lint-staged is good but cannot flexibly modify the command to fit in the Vite project.

### Concurrently + Chokidar

- [Concurrently](https://www.npmjs.com/package/concurrently) lets us run multiple tasks at the same time.
- [Chokidar CLI](https://www.npmjs.com/package/chokidar-cli) watches for file changes and performs actions automatically.
- We use these tools to automatically lint files once the files have been update.

## Dockerize and Environment Variable

- The env.js is imported in the ./index.html, we can get the value by:

```javascript
window._env_[envKey]
```

- For local development, public/env.js is generated when we run 'yarn dev' or update ./.env.
- For production, environment variables in the Docker container are combined with ./env to create env.js.
- That means we can update env.js in the container by executing:

```bash
docker run -e HELLO=testing react-comprehensive-setup
```
