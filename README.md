# ledger-api

Payments microservice for tokenising PANs and serving transaction metadata.
Deployed on Kubernetes in the `payments` namespace.

## Endpoints

| Method | Path            | Description                          |
|--------|-----------------|--------------------------------------|
| GET    | `/health`       | Liveness check                       |
| POST   | `/tokenize`     | `{"pan": "..."}` → opaque token      |
| GET    | `/transactions` | Recent transaction records           |
| POST   | `/import`       | Import a YAML configuration blob     |
| GET    | `/fetch?url=`   | Fetch a remote resource by URL       |

# Task 1 - Deploy & Harden the Workload

## Overview

The objective of this task was to deploy and secure the vulnerable ledger-api application by implementing Kubernetes security best practices, RBAC, secrets management, ingress, and admission control policies.

---

## Components Deployed

### Application Workloads
- ledger-api Deployment
- reporting neighbour service
- Kubernetes Service
- ConfigMap
- Ingress

### Security Hardening
- Dedicated ServiceAccount (ledger-api-sa)
- Least-privilege RBAC (Role & RoleBinding)
- Non-root container execution
- Read-only root filesystem
- Dropped all Linux capabilities
- Seccomp RuntimeDefault
- Resource requests and limits
- Liveness and Readiness probes

### Secrets Management
- Removed hardcoded secrets from Deployment manifests
- Created Kubernetes Secret
- Implemented Bitnami Sealed Secrets
- Stored encrypted secret as SealedSecret resource

### Admission Control
- Installed Kyverno
- Implemented policy to prevent containers running as root
- Implemented policy to block image tags using :latest
- Verified policy enforcement using an insecure deployment

---

## Validation Performed

### Workload Validation
- Verified all application pods are running
- Verified readiness and liveness probes
- Verified ServiceAccount association

### Security Validation
- Verified RBAC configuration
- Verified ConfigMap and Secret usage
- Verified Sealed Secret creation
- Verified Ingress availability

### Policy Enforcement Validation
The following insecure deployment was intentionally tested:

- Running container as root
- Using nginx:latest image

Kyverno successfully blocked the deployment and returned validation errors.

---

## Screenshots

Refer to:

screenshots/task1/

Included Evidence:

1. Hardened Deployment
2. Kubernetes Cluster Ready
3. Application Pods Running
4. ServiceAccount Creation
5. RBAC Configuration
6. ConfigMap Creation
7. Kubernetes Secret
8. Sealed Secret
9. Ingress Configuration
10. Kyverno Policies
11. Policy Rejection Demonstration

---

## Result

Task 1 successfully demonstrates workload hardening, secret management, ingress configuration, RBAC implementation, and Kubernetes admission control enforcement.
