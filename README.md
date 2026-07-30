# Dodo Payments - Security & DevOps Engineer Technical Assessment

## Overview

This repository contains the implementation of all completed assessment tasks for the Dodo Payments Security & DevOps Engineer Technical Assessment.

The work focuses on:

- Kubernetes workload hardening
- Secure CI/CD and software supply chain security
- Zero-trust networking with Istio
- Reconnaissance and attack-surface assessment

---

# Task 1 - Deploy & Harden the Workload

Objectives completed:

- Dedicated ServiceAccount
- Least-Privilege RBAC
- Security Context Hardening
- Readiness & Liveness Probes
- Resource Requests & Limits
- ConfigMaps
- Kubernetes Secrets
- Sealed Secrets
- NGINX Ingress
- Kyverno Admission Policies
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

# Task 2 - Secure CI/CD Pipeline & Supply Chain

Objectives completed:

- GitHub Actions Pipeline
- Gitleaks Secret Scanning
- Semgrep SAST Scanning
- Trivy Vulnerability Scanning
- Docker Image Build
- GitHub Container Registry (GHCR)
- Cosign Image Signing
- GitOps with ArgoCD
- Automatic Sync
- Drift Detection
- Self-Healing

Documentation:

```text
cicd/README.md
```

Screenshots:

```text
screenshots/task2/
```

---

# Task 3 - Service Mesh & Zero Trust Security

Objectives completed:

- Istio Service Mesh Installation
- mTLS STRICT Enforcement
- PeerAuthentication Policies
- Authorization Policies
- Identity-Based Access Control
- NetworkPolicy Enforcement
- Authorized Access Validation
- Unauthorized Access Blocking

Documentation:

```text
task3-istio/README.md
```

Screenshots:

```text
screenshots/task3/
```

---

# Task 4 Part A - Reconnaissance & Attack Surface Review

Objectives completed:

- Passive OSINT Reconnaissance
- Certificate Transparency Enumeration
- Subdomain Discovery
- Asset Discovery
- Live Host Identification
- Technology Fingerprinting
- TLS Posture Assessment
- Attack Surface Report

Artifacts:

```text
task4-parta/
├── subfinder.txt
├── assetfinder.txt
├── all-subs.txt
├── live-hosts.txt
├── whatweb-results.txt
├── testssl-results.txt
└── attack-surface-report.md
```

Screenshots:

```text
screenshots/task4-PartA/
```

---

# Repository Structure

```text
.
├── app/
├── cicd/
├── deploy/
├── hardening/
├── task3-istio/
├── task4-parta/
├── screenshots/
│   ├── task1/
│   ├── task2/
│   ├── task3/
│   └── task4-PartA/
└── README.md
```

---

# Technologies Used

- Kubernetes
- Kind
- Docker
- GitHub Actions
- ArgoCD
- Cosign
- GHCR
- Kyverno
- Istio
- Gitleaks
- Trivy
- Semgrep
- NGINX Ingress
- Sealed Secrets
- WhatWeb
- testssl.sh
- Subfinder
- Assetfinder

---

# Assignment Status

| Task | Status |
|--------|--------|
| Task 1 | ✅ Completed |
| Task 2 | ✅ Completed |
| Task 3 | ✅ Completed |
| Task 4 Part A | ✅ Completed |
| Task 4 Part B | 🚧 In Progress |

---

# Final Outcome

Successfully demonstrated:

- Kubernetes security hardening
- Secure software supply chain
- GitOps deployment model
- Zero-trust networking with Istio
- Attack surface enumeration and analysis
