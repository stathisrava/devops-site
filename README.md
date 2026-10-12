# DevOps Site

A DevOps project demonstrating containerization, CI security scanning, infrastructure as code, and a simple website served by NGINX.
Live Website: https://devops-site.stathisrav.workers.dev/

## Technologies

- **Docker** — Containerizes the website.
- **NGINX** — Serves the static HTML page.
- **Docker Compose** — Simplifies local build and execution.
- **GitHub Actions** — Automates CI checks.
- **Trivy** — Scans the container image for vulnerabilities.
- **Terraform** — Defines and validates infrastructure as code.
- **Cloudflare Workers** — Provides a serverless web-serving component.


## Getting Started

### Run Locally

Clone the repository:

```bash
git clone https://github.com/stathisrava/devops-site.git
cd devops-site
```

Build the Docker image and start the service:

```bash
docker compose up --build
```

Open the website in your browser:

http://localhost:8080

Docker Compose builds the image using the `Dockerfile`, starts the NGINX container, and maps port `8080` on your machine to port `80` inside the container.


## Continuous Integration

The GitHub Actions workflow runs on pushes to the `main` branch and on pull requests.

It performs two main jobs:

### 1. Docker Build and Security Scan

- Builds the Docker image.
- Uses Trivy to scan the image for **HIGH** and **CRITICAL** vulnerabilities.
- Fails the scan step when vulnerabilities matching the configured criteria are detected.

The scan is configured to ignore unfixed vulnerabilities.

### 2. Terraform Validation

- Initializes Terraform without configuring a remote backend.
- Checks Terraform formatting.
- Validates the Terraform configuration.

These checks help catch container build issues, potential image vulnerabilities, and infrastructure configuration errors early in the development process.

## Infrastructure as Code

The `terraform/` directory contains the Terraform configuration and a Cloudflare Worker script.

Terraform is used to define the Cloudflare Worker resource and manage its configuration as code. The GitHub Actions workflow validates the Terraform configuration, but validation alone does not deploy infrastructure.

Configure any required Cloudflare credentials and variables securely before running Terraform operations that interact with real infrastructure.




