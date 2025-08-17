# DevSecOps Walkthrough

The purpose of this repository is to demonstrate my current knowledge of the following tools, practices, and architectural principles:

## Principles and practices
- [12 Factor App: Cloud Native Principles](https://12factor.net/)
- DevSecOps
- Infrastructure as Code (IaC)
- Automated testing
- Static code analysis
- Continuous Integration and Continuous Deployment (CI/CD)

## Tools
- OpenTofu (Terraform)
- Java 21
- Quarkus
- AWS
- Docker (used for containerization in Quarkus workloads)
- GitHub Actions
- Static code analysis
  - (Code) [SpotBugs](https://spotbugs.github.io/)
  - (Pipelines) [Trivy](https://trivy.dev/latest/)
- Dependabot for dependency management
- Copilot for PR reviews

## Cheat sheet for demos

Configure kubectl with EKS cluster:

```bash
aws eks --region <<us-east-1>> update-kubeconfig --name <<vorozco-eks>>
```

## Infra status

[![OpenTofu CI](https://github.com/tuxtor/devsecops-walkthrough/actions/workflows/opentofu.yml/badge.svg)](https://github.com/tuxtor/devsecops-walkthrough/actions/workflows/opentofu.yml)

## Quarkus Cloud Native Workload

[![Quarkus CI](https://github.com/tuxtor/devsecops-walkthrough/actions/workflows/quarkus.yml/badge.svg)](https://github.com/tuxtor/devsecops-walkthrough/actions/workflows/quarkus.yml)