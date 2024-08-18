# Laravel Dockerize Project
## Overview

This project serves as an educational guide for Laravel developers looking to create modern, efficient, and flexible Docker environments for both development and production. It demonstrates best practices in building Docker images tailored for Laravel applications, providing a solid foundation for developers to understand and extend Docker functionalities in their own projects.

## Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Development Environment](#development-environment)
- [Key Features](#key-features)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Production Environment](#production-environment)
- [Building the Production Image](#building-the-production-image)
- [Deploying](#deploying)
- [Technical Details](#technical-details)
- [Contributing](#contributing)
- [License](#license)

## Project Structure

The project is divided into three main parts: example Laravel 11 app used to test docker environments,
development environment and production environment.

### Development Environment

Focuses on providing a flexible and independent environment that includes all necessary tools for typical Laravel development, such as Redis, MariaDB/PostgreSQL, and Node.js for building frontend assets. This environment supports rapid development and testing.

### Production Environment

Emphasizes building a slim, secure, and efficient Docker image suitable for deploying a Laravel application in production. The image is optimized for performance, with pre-built assets and only essential dependencies.

## Key Features

### Development Environment

- Complete Development Stack: Includes PHP, MySQL/PostgreSQL, Redis, and Node.js.
- Hot-Reloading: Supports live reloading of code changes for rapid development.
- Service Flexibility: Easily swap out or add services (e.g., switching between MySQL and PostgreSQL).
- Persistent Volumes: Code changes are reflected immediately without rebuilding containers.

### Production Environment

- Optimized Image: The production image is slim, containing only the necessary dependencies for running a Laravel application.
- Pre-Built Assets: Assets are built during the image creation process, ensuring that the production environment is ready to serve content immediately.
- Security Best Practices: The image is built with security in mind, minimizing the attack surface by excluding unnecessary packages and users.

## Getting Started

To get started with this project, follow these steps:

1. Clone the Repository:

```bash
git clone https://github.com/yourusername/laravel-dockerize.git
cd laravel-dockerize
```

2. Start the Development Environment:

```bash
cd development/
docker-compose up -d
```

3. Install Laravel Dependencies:

```bash
docker-compose exec workspace bash
composer install
npm install
npm run dev
```

4. Access the Application:

Open your browser and navigate to [http://localhost](http://localhost).

## Usage

### Access the Workspace Container:

```bash
docker-compose exec workspace bash
```

### Run Artisan Commands:

```bash
docker-compose exec workspace php artisan migrate
```

### Rebuild Containers:

```bash
docker-compose up -d --build
```

## Production Environment

### Key Features

- Optimized Image: The production image is slim, containing only the necessary dependencies for running a Laravel application.
- Pre-Built Assets: Assets are built during the image creation process, ensuring that the production environment is ready to serve content immediately.
- Security Best Practices: The image is built with security in mind, minimizing the attack surface by excluding unnecessary packages and users.

### Building the Production Image

1. Build the Image:

```bash
docker build -f Dockerfile.prod -t laravel-app:latest .
```

2. Run the Container:

```bash
docker run -d -p 9000:9000 laravel-app:latest
```

### Deploying

The production image can be deployed to any Docker-compatible hosting environment, such as AWS ECS, Kubernetes, or a traditional VPS.

## Technical Details

- PHP: Version 8.3 FPM is used for optimal performance in production.
- Node.js: Version 18.x is used in development for building frontend assets with Vite.
- MySQL/PostgreSQL: Both databases are supported, allowing flexibility depending on your application's requirements.
- Redis: Integrated for caching and session management.

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the Repository: Click the "Fork" button at the top right of this page.
2. Clone Your Fork:

```bash
git clone https://github.com/yourusername/laravel-dockerize.git
cd laravel-dockerize
```

3. Create a Branch:

```bash
git checkout -b feature-branch
```

4. Make Your Changes.

5. Commit Your Changes:

```bash
git commit -m "Description of changes"
```

6. Push to Your Fork:

```bash
git push origin feature-branch
```

7. Create a Pull Request: Navigate to the original repository and create a new pull request.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.