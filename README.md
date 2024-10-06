# Laravel Docker Examples Project

## Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
  - [Example App](#example-app)
  - [Development Environment](#development-environment)
  - [Production Environment](#production-environment)
- [Getting Started](#getting-started)
  - [Clone the Repository](#clone-the-repository)
  - [Setting Up the Development Environment](#setting-up-the-development-environment)
- [Usage](#usage)
- [Production Environment](#production-environment-1)
  - [Building and Running the Production Environment](#building-and-running-the-production-environment)
- [Technical Details](#technical-details)
- [Contributing](#contributing)
  - [How to Contribute](#how-to-contribute)
- [License](#license)


## Overview

The **Laravel Docker Examples Project** provides practical examples and comprehensive guidance for Laravel developers to create modern, efficient, and flexible Docker environments for both development and production. By demonstrating best practices and offering detailed configurations, this project helps you build Docker images tailored for Laravel applications. Whether you're new to Docker or looking to optimize your deployment workflow, these examples serve as a solid foundation to understand and extend Docker functionalities in your Laravel projects.


## Project Structure

The project is organized into the following main directories:

- **example-app**: Contains a sample Laravel 11 application used to test and demonstrate Docker environments.
- **development**: Includes Docker configurations and Compose files for setting up a complete development environment.
- **production**: Contains Dockerfiles and Compose files optimized for a production environment.

### example-app

The `example-app` directory holds the sample Laravel application. It includes basic routes, a health check endpoint to test database and Redis connections, and demonstrates how to integrate Laravel with Docker. This serves as a practical example to illustrate the concepts discussed in this project.

### Development Environment

Located in the `development` directory, this environment focuses on providing a flexible and independent setup that includes all necessary tools for typical Laravel development:

- **Services**: PHP-FPM, Nginx, Node.js, Redis, and PostgreSQL.
- **Hot Reloading**: Supports live reloading of code changes without rebuilding containers.
- **Custom Dockerfiles**: Allows customization of images to include extensions and tools needed for development.
- **Docker Compose**: Orchestrates the various services, making it easy to start and stop the entire environment.

### Production Environment

The `production` directory emphasizes building a slim, secure, and efficient Docker image suitable for deploying a Laravel application in production:

- **Optimized Images**: Uses multi-stage builds to keep the final image size small.
- **Pre-Built Assets**: Assets are compiled during the build process to ensure the container is ready to serve content immediately.
- **Security Best Practices**: Minimizes the attack surface by excluding unnecessary packages and users.
- **Docker Compose for Production**: Provides a Compose file tailored for deploying the application with services like Nginx, PHP-FPM, Redis, and PostgreSQL.


## Getting Started

Follow these steps to set up and run the Laravel Docker Examples Project:

### Clone the Repository

```bash
git clone https://github.com/rw4lll/laravel-docker-examples.git
cd laravel-docker-examples
```

### Setting Up the Development Environment

1. Navigate to the specific example in Development Directory:

```bash
cd development/nginx-fpm
```

2. Copy the .env.example file to .env and adjust any necessary environment variables:

```bash
cp .env.example .env
```

3. Start the Docker Compose Services:

```bash
docker compose up -d
```

4. Install Laravel Dependencies:

```bash
docker compose exec workspace bash
composer install
npm install
npm run dev
```

5. Run Migrations:

```bash
docker compose exec workspace php artisan migrate
```

6. Access the Application:

Open your browser and navigate to [http://localhost](http://localhost).

## Usage

Here are some common commands and tips for using the development environment:

### Accessing the Workspace Container

The workspace container includes Composer, Node.js, NPM, and other tools necessary for development.

```bash
docker compose exec workspace bash
```

### Run Artisan Commands:

```bash
docker compose exec workspace php artisan migrate
```

### Rebuild Containers:

```bash
docker compose up -d --build
```

### Stop Containers:

```bash
docker compose down
```

### View Logs:

```bash
docker compose logs -f
```

For specific services, you can use:

```bash
docker compose logs -f web
```

## Production Environment

The production environment is designed with security and efficiency in mind:

- **Optimized Docker Images**: Uses multi-stage builds to minimize the final image size, reducing the attack surface.
- **Environment Variables Management**: Sensitive data such as passwords and API keys are managed carefully to prevent exposure.
- **User Permissions**: Containers run under non-root users where possible to follow the principle of least privilege.
- **Health Checks**: Implemented to monitor the status of services and ensure they are functioning correctly.
- **HTTPS Setup**: While not included in this example, it's recommended to configure SSL certificates and use HTTPS in a production environment.


### Building and Running the Production Environment

1. **Navigate to the specific example in Production Directory :**

```bash
cd production/nginx-fpm/
```

2. Copy the .env.example file to .env (compose env, not the laravel env file) and adjust any necessary environment variables:

```bash
cp .env.example .env
```

3. Start the Docker Compose Services:

```bash
docker compose up -d
```

### Deploying

The production image can be deployed to any Docker-compatible hosting environment, such as AWS ECS, Kubernetes, or a traditional VPS.

## Technical Details

- **PHP**: Version **8.3 FPM** is used for optimal performance in both development and production environments.
- **Node.js**: Version **22.x** is used in the development environment for building frontend assets with Vite.
- **PostgreSQL**: Version **16** is used as the database in the examples, but you can adjust the configuration to use MySQL if preferred.
- **Redis**: Used for caching and session management, integrated into both development and production environments.
- **Nginx**: Used as the web server to serve the Laravel application and handle HTTP requests.
- **Docker Compose**: Orchestrates the services, simplifying the process of starting and stopping the environment.
- **Health Checks**: Implemented in the Docker Compose configurations and Laravel application to ensure all services are operational.


## Contributing

Contributions are welcome! Whether you find a bug, have an idea for improvement, or want to add a new feature, your input is valuable.

### How to Contribute

1. **Fork the Repository:**

   Click the "Fork" button at the top right of this page to create your own copy of the repository.

2. **Clone Your Fork:**

```bash
    git clone https://github.com/your-user-name/laravel-docker-examples.git
    cd laravel-docker-examples
```

3. Create a Branch:

```bash
    git checkout -b your-feature-branch
```

4. Make Your Changes.

    Implement your changes or additions.

5. Commit Your Changes:

```bash
git commit -m "Description of changes"
```

6. Push to Your Fork:

```bash
    git push origin feature-branch
```

7. Submit a Pull Request:
    - Go to the original repository.
    - Click on "Pull Requests" and then "New Pull Request."
    - Select your fork and branch, and submit your pull request.

## License

This project is licensed under the MIT License. See the [LICENSE]LICENSE file for more details.