# Dodo DevSecOps Assignment

## Overview

This repository contains the implementation of both assignment tasks:

### Task 1 - Kubernetes Workload Hardening

Objectives completed:

- Dedicated ServiceAccount
- RBAC
- Security Context Hardening
- Resource Requests & Limits
- Readiness & Liveness Probes
- ConfigMap
- Kubernetes Secret
- Sealed Secret
- NGINX Ingress
- Kyverno Policies
- Policy Enforcement Validation

Documentation:

```text
hardening/README.md
```

Screenshots:

```text
screenshots/task1/
```

---

### Task 2 - Secure CI/CD & GitOps

Objectives completed:

- GitHub Actions Pipeline
- Gitleaks Secret Scanning
- Trivy Vulnerability Scanning
- Semgrep SAST Scanning
- Docker Build
- GitHub Container Registry (GHCR)
- Cosign Image Signing
- ArgoCD Installation
- GitOps Deployment
- Automatic Sync
- Self Healing
- Prune Resources

Documentation:

```text
cicd/README.md
```

Screenshots:

```text
screenshots/task2/
```

---

## Repository Structure

```text
.
├── app/
├── deploy/
├── hardening/
│   └── README.md
├── cicd/
│   └── README.md
├── screenshots/
│   ├── task1/
│   └── task2/
└── README.md
```

---

## Technologies Used

- Kubernetes
- Kind
- Docker
- GitHub Actions
- Gitleaks
- Trivy
- Semgrep
- GitHub Container Registry (GHCR)
- Cosign
- ArgoCD
- Kyverno
- NGINX Ingress Controller
- Sealed Secrets

---

## Assignment Status

### Task 1

✅ Completed

### Task 2

✅ Completed

---

## Final Result

Successfully implemented:

- Kubernetes workload hardening
- Policy enforcement using Kyverno
- Secure CI/CD pipeline
- Container image signing
- GitOps deployment using ArgoCD
