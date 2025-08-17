# GitHub Copilot Instructions

## Purpose
This repository demonstrates best practices in DevSecOps, cloud-native architecture, and modern CI/CD workflows using the following technologies:
- OpenTofu (Terraform)
- Java 21
- Quarkus
- AWS
- Docker
- GitHub Actions

## Coding Guidelines
- Follow the [12 Factor App principles](https://12factor.net/) for cloud-native development.
- Use Infrastructure as Code (IaC) for all cloud resources.
- Write clean, maintainable, and well-documented code.
- Prefer statically typed languages and modern frameworks.
- Use environment variables for configuration.
- Containerize workloads using Docker.
- When adding new Terraform objects, avoid the use of this. Instead use a generic name -e.g. "aws_ecr_repository" "ecr_repository" -

## CI/CD & Quality
- All code must pass automated tests before merging.
- Use GitHub Actions for CI/CD pipelines.
- Run static code analysis (e.g., SpotBugs for Java) in CI pipelines.
- Apply infrastructure changes only on the main branch.
- Ensure workflows run on all branches for testing and planning.

## Security & Best Practices
- Do not commit secrets or sensitive data.
- Use GitHub secrets for credentials.
- Follow least privilege principle for IAM roles and policies.
- Review and validate all pull requests before merging.

## Documentation
- Update README.md and code comments for any significant changes.
- Document architectural decisions and workflow configurations.

## Additional Recommendations
- Use workflow badges for visibility of pipeline status.
- Keep dependencies up to date.
- Prefer open-source tools and libraries.

---

These instructions guide Copilot and contributors to maintain high standards in code quality, security, and cloud-native practices throughout this repository.

