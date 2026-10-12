# DevOps Site

A DevOps portfolio project demonstrating containerization, continuous integration, container image security scanning, infrastructure as code, and website hosting with Cloudflare Workers.  

**Live Website:** https://devops-site.stathisrav.workers.dev/  

## Technologies

- **Docker** — Packages the website into a container image.
- **NGINX** — Serves the static HTML page locally.
- **Docker Compose** — Simplifies local build and execution.
- **GitHub Actions** — Automates continuous integration checks.
- **Trivy** — Scans the container image for vulnerabilities.
- **Terraform** — Defines and validates Cloudflare infrastructure as code.
- **Cloudflare Workers** — Hosts the publicly accessible website.
- **Bash and Git** — Automates common version-control operations.


## Getting Started

### Run Locally

Clone the repository:

```bash
git clone https://github.com/stathisrava/devops-site.git
cd devops-site
```

Build the Docker image and start the website:

```bash
docker compose up --build
```

Open the website in your browser:

http://localhost:8080

Docker Compose builds the image using the `Dockerfile`, starts the NGINX container, and maps port `8080` on your machine to port `80` inside the container.


## Continuous Integration

The GitHub Actions workflow runs on pushes to the `main` branch and on pull requests.

### Docker Build and Security Scan

- Builds the Docker image.
- Uses Trivy to scan for **HIGH** and **CRITICAL** vulnerabilities.
- Fails the scan step when vulnerabilities matching the configured criteria are detected.
- Ignores vulnerabilities for which no fix is available.

### Terraform Validation

- Initializes Terraform without configuring a remote backend.
- Checks Terraform formatting.
- Validates the Terraform configuration.

**Note:** The CI workflow validates the Terraform configuration but does not automatically deploy infrastructure.

## Infrastructure as Code

The `terraform/main.tf` file defines infrastructure for Cloudflare Workers using Terraform.

The configuration includes:

- The Cloudflare provider.
- Variables for the Cloudflare API token and account ID.
- A Worker resource with an inline request handler.
- A reference to the `public/` directory for static assets.
- Configuration to enable access through a `workers.dev` subdomain.

## Git Automation Script

The `scripts/git-push.sh` script automates common Git operations:

1. Displays the current Git status.
2. Stages changes using `git add .`.
3. Creates a commit using the first command-line argument as the commit message.
4. Pushes the commit to the remote repository.
5. Checks whether the commit and push operations succeeded.

Run the script from the repository root using Git Bash or another Bash-compatible terminal:

```bash
bash scripts/git-push.sh "Update website"
```
