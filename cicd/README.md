# Task 2 - Secure CI/CD Pipeline & GitOps

## Objective

Build a secure DevSecOps CI/CD pipeline that automatically scans, builds, signs, stores, and deploys container images.

---

## CI/CD Pipeline

Implemented using:

- GitHub Actions

Pipeline Flow:

Code Push
↓
Gitleaks
↓
Trivy
↓
Semgrep
↓
Docker Build
↓
GHCR Push
↓
Cosign Signing
↓
ArgoCD GitOps Deployment

---

## Gitleaks

Purpose:

- Detect hardcoded secrets
- Prevent credential leakage

Examples:

- API Keys
- Passwords
- Tokens

Result:

- Repository scanned automatically during pipeline execution

---

## Trivy

Purpose:

- Detect vulnerabilities and CVEs
- Scan project filesystem and dependencies

Result:

- Security scan executed before deployment

---

## Semgrep

Purpose:

- Static Application Security Testing (SAST)
- Detect insecure coding patterns

Findings:

- Insecure YAML deserialization
- Flask service exposure warning

Result:

- Source code analyzed automatically during pipeline execution

---

## Container Build

Docker image built automatically:

ledger-api

Result:

- Reproducible image generation

---

## GitHub Container Registry (GHCR)

Image published to:

ghcr.io/sasi56/ledger-api

Purpose:

- Central artifact storage
- Source for deployment

---

## Cosign

Purpose:

- Container image signing
- Software supply chain security

Result:

- Container image digitally signed

Benefits:

- Verify integrity
- Verify authenticity

---

## ArgoCD

Installed in Kubernetes cluster.

Purpose:

- GitOps deployment
- Continuous reconciliation

Repository:

https://github.com/sasi56/dodo-devsecops-assignment

Application:

ledger-api

Features Enabled:

- Automatic Sync
- Self Heal
- Prune Resources

---

## GitOps Workflow

Git Repository
↓
ArgoCD Watches Repository
↓
Changes Detected
↓
Automatic Synchronization
↓
Kubernetes Updated

Result:

- No manual kubectl apply required

---

## Security Controls Implemented

✅ Gitleaks

✅ Trivy

✅ Semgrep

✅ Docker Build

✅ GHCR Push

✅ Cosign Signing

✅ ArgoCD GitOps

✅ Automatic Synchronization

✅ Self Healing

✅ Drift Detection

---

## Evidence

Refer:

screenshots/task2/

For:

1. Kyverno Policies
2. ArgoCD Pods
3. ArgoCD Healthy & Synced Application
4. GitHub Actions Pipeline
5. GHCR Image
6. Cosign Signing

---

## Final Result

Successfully implemented a secure DevSecOps CI/CD pipeline with automated security scanning, container signing, artifact publishing, and GitOps deployment using ArgoCD.
