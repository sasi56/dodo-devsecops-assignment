# Dodo Payments DevSecOps Assessment

## Candidate
Sasikumar E M

## Role
Security & DevOps Engineer - Technical Assessment

## Overview
This repository contains my implementation of the Dodo Payments DevSecOps technical assessment. The work covers Kubernetes workload hardening, secure CI/CD and supply chain controls, Istio-based zero-trust networking, and reconnaissance / penetration testing documentation.

## Repository Structure

| Folder | Description |
|---|---|
| app/ | Ledger API application source code and Dockerfile |
| deploy/ | Base Kubernetes deployment manifests |
| task1-workload-hardening/ | Hardened Kubernetes manifests, RBAC, secrets, and Kyverno policies |
| task2-secure-cicd/ | Secure CI/CD documentation and pipeline evidence |
| task3-istio-zero-trust/ | Istio mTLS, AuthorizationPolicy, and NetworkPolicy manifests |
| task4-recon-pentest/ | Passive recon outputs and penetration testing report |
| screenshots/ | Evidence screenshots for Tasks 1, 2, 3, and 4 |
| docs/ | Supporting documentation or diagrams, if applicable |

## Task Summary

### Task 1 - Deploy & Harden the Workload
Implemented Kubernetes workload hardening for ledger-api using:

- Non-root container execution
- Read-only root filesystem
- Dropped Linux capabilities
- RuntimeDefault seccomp profile
- Resource requests and limits
- Liveness and readiness probes
- Dedicated ServiceAccount
- Least-privilege RBAC
- ConfigMap and secret handling
- Sealed Secret manifest
- Kyverno guardrails to reject insecure workloads

Evidence is available in:

- task1-workload-hardening/
- screenshots/task1/

### Task 2 - Secure CI/CD Pipeline & Supply Chain
Implemented secure delivery controls using GitHub Actions and supporting DevSecOps tooling.

Covered areas:

- GitHub Actions pipeline
- GHCR image build/publish evidence
- Security scanning evidence
- Cosign image signing evidence
- ArgoCD GitOps sync and self-heal evidence

Evidence is available in:

- task2-secure-cicd/
- screenshots/task2/

### Task 3 - Service Mesh & Zero Trust
Implemented Istio-based zero-trust controls.

Covered areas:

- Istio mTLS STRICT mode
- PeerAuthentication
- Default deny AuthorizationPolicy
- Explicit allow based on workload identity
- Kubernetes NetworkPolicy for defense-in-depth
- Authorized and unauthorized access validation

Evidence is available in:

- task3-istio-zero-trust/
- screenshots/task3/

### Task 4 - Reconnaissance & Penetration Testing
Implemented passive reconnaissance documentation for dodopayments.tech and prepared a penetration testing report for the authorized target/local lab.

Covered areas:

- Subdomain enumeration
- Public attack surface inventory
- Live host identification
- Technology fingerprinting
- TLS posture review
- Risk observations
- Penetration testing report template with CVSS and remediation structure

Evidence and reports are available in:

- task4-recon-pentest/part-a-recon/
- task4-recon-pentest/reports/pentest-report.md
- screenshots/task4-PartA/

## Important Scope Note
Passive reconnaissance was limited to public information such as DNS, certificate transparency data, HTTP banners, and TLS posture. Active testing was not performed against production dodopayments.tech or dodopayments.com hosts. Active testing is intended only for the authorized vulnerable target or local lab environment.

## Security Gate Policy

| Control | Tool / Method | Policy |
|---|---|---|
| Secrets scan | Gitleaks | Hard block for exposed secrets |
| SAST | Semgrep | Block high-confidence high/critical findings |
| Image scan | Trivy / similar | Block critical vulnerabilities with available fixes |
| Image signing | Cosign | Required for trusted image promotion |
| GitOps | ArgoCD | Cluster state reconciled from Git |
| Admission control | Kyverno | Reject root containers and latest tags |

## Evidence Checklist

- [x] Kubernetes hardened deployment evidence
- [x] ServiceAccount and RBAC evidence
- [x] Secret / Sealed Secret evidence
- [x] Kyverno policy rejection evidence
- [x] GitHub Actions pipeline evidence
- [x] GHCR image evidence
- [x] Cosign signing evidence
- [x] ArgoCD sync evidence
- [x] Istio mTLS STRICT evidence
- [x] AuthorizationPolicy allow/deny evidence
- [x] NetworkPolicy evidence
- [x] Passive reconnaissance outputs
- [x] Attack surface report
- [x] Penetration testing report structure

## How to Review
Start from this README, then review each task folder and corresponding screenshots.

Recommended review order:

1. task1-workload-hardening/
2. task2-secure-cicd/
3. task3-istio-zero-trust/
4. task4-recon-pentest/
5. screenshots/

## Notes
All implementation work was performed using local/free tooling as required by the assessment.
