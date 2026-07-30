# Task 2 - Secure CI/CD Pipeline & Supply Chain

## Objective
The goal of this task is to secure the delivery path for the ledger-api application by enforcing security checks in CI/CD instead of relying on manual review.

## Tools / Controls Used
- GitHub Actions
- GitHub Container Registry / GHCR
- Gitleaks for secrets scanning
- Semgrep for SAST
- Trivy for dependency and image vulnerability scanning
- Cosign for image signing
- ArgoCD for GitOps deployment and drift detection
- Kyverno admission policies from Task 1

## Implementation Summary

### 1. CI/CD Pipeline
A GitHub Actions workflow was configured to automate the build and security validation process.

The pipeline covers:

- Source checkout
- Application build
- Container image build
- Security scanning
- Image publish to GHCR
- Image signing using Cosign
- Deployment through GitOps workflow

### 2. Security Scanning
Security gates were added to detect issues before deployment.

| Security Gate | Tool | Policy |
|---|---|---|
| Secrets scanning | Gitleaks | Hard block exposed secrets |
| Static analysis | Semgrep | Block high-confidence severe findings |
| Dependency scanning | Trivy | Block critical vulnerabilities with available fixes |
| Image scanning | Trivy | Block critical image vulnerabilities with available fixes |
| Image signing | Cosign | Required before trusted deployment |

### 3. Image Signing
Cosign was used to sign the container image. Signing evidence is available in the screenshots folder.

### 4. GitOps with ArgoCD
ArgoCD was used as the deployment source of truth. Evidence includes:

- ArgoCD pods running
- Application synced and healthy
- GitOps reconciliation evidence

## Evidence

Screenshots are available at:

- ../screenshots/task2/task2-01-kyverno-restored.png
- ../screenshots/task2/task2-02-argocd-pods-running.png
- ../screenshots/task2/task2-03-argocd-healthy-synced.png
- ../screenshots/task2/task2-04-github-actions-success.png
- ../screenshots/task2/task2-05-ghcr-image.png
- ../screenshots/task2/task2-06-cosign-signing-success.png

## Design Decisions

### Why GitHub Actions?
GitHub Actions was selected because it integrates directly with the repository and supports free hosted runners.

### Why GHCR?
GHCR was selected because it integrates easily with GitHub Actions and supports container image publishing without needing a cloud account.

### Why Cosign?
Cosign was used to prove image integrity and establish supply chain trust.

### Why ArgoCD?
ArgoCD was used to keep Kubernetes deployment state driven from Git and to demonstrate GitOps-based reconciliation.

## Limitations / Future Improvements
- Add SARIF upload for scanner results so findings appear in the GitHub Security tab.
- Add explicit Cosign verification output screenshot.
- Add SLSA provenance attestation evidence.
- Add canary or blue-green deployment strategy.
