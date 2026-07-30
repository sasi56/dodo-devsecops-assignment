# Task 1 - Deploy & Harden the Workload

## Objective
The objective of this task is to deploy the ledger-api workload on Kubernetes and harden it using production-grade security controls.

## What Was Implemented

### 1. Kubernetes Workload Deployment
The ledger-api application was deployed using Kubernetes manifests.

Included resources:

- Namespace
- Deployment
- Service
- ConfigMap
- Ingress
- Neighbour service

### 2. Container Security Context
The workload was hardened using strict container security settings:

- Run as non-root user
- Read-only root filesystem
- Dropped Linux capabilities
- RuntimeDefault seccomp profile
- Privilege escalation disabled

### 3. Resource Management
Resource requests and limits were configured to prevent uncontrolled resource usage.

### 4. Health Checks
Liveness and readiness probes were configured to help Kubernetes detect unhealthy containers and route traffic only to ready pods.

### 5. ServiceAccount and RBAC
A dedicated ServiceAccount was created for the ledger-api workload.

Least-privilege RBAC resources were added:

- serviceaccount.yaml
- role.yaml
- rolebinding.yaml

### 6. Secrets Management
Plaintext Kubernetes secret manifests were removed from the repository.

Secrets are represented using:

- sealed-secret.yaml

This avoids committing plaintext sensitive values to Git.

### 7. Admission Control with Kyverno
Kyverno policies were added to reject insecure workloads.

Policies included:

- disallow-root.yaml
- disallow-latest.yaml

A bad deployment manifest was also included to demonstrate policy rejection:

- bad-deployment.yaml

## Files

| File | Purpose |
|---|---|
| deployment-hardened.yaml | Hardened ledger-api Deployment |
| serviceaccount.yaml | Dedicated ServiceAccount |
| role.yaml | Least-privilege Role |
| rolebinding.yaml | RoleBinding for ServiceAccount |
| configmap.yaml | Non-sensitive configuration |
| sealed-secret.yaml | Sealed Secret manifest |
| ingress.yaml | Ingress resource |
| disallow-root.yaml | Kyverno policy to block root containers |
| disallow-latest.yaml | Kyverno policy to block latest image tags |
| bad-deployment.yaml | Insecure deployment used for rejection test |

## Evidence

Screenshots are available at:

- ../screenshots/task1/01-hardened-deployment-details.png
- ../screenshots/task1/02-cluster-ready.png
- ../screenshots/task1/03-hardened-pods-running.png
- ../screenshots/task1/04-serviceaccount-created.png
- ../screenshots/task1/05-rbac-role-rolebinding.png
- ../screenshots/task1/06-configmap-created.png
- ../screenshots/task1/08-sealed-secret-created.png
- ../screenshots/task1/09-ingress-created.png
- ../screenshots/task1/10-kyverno-policies.png
- ../screenshots/task1/11-kyverno-policy-rejection.png

## Design Decisions

### Why non-root containers?
Running as non-root reduces the impact of a container escape or application compromise.

### Why read-only root filesystem?
A read-only root filesystem reduces the ability of attackers to modify binaries, write persistence files, or tamper with the container runtime environment.

### Why drop Linux capabilities?
Dropping capabilities follows least privilege and removes unnecessary kernel-level permissions.

### Why dedicated ServiceAccount?
Using a dedicated ServiceAccount avoids relying on the default ServiceAccount and allows RBAC to be scoped only to what the application needs.

### Why Sealed Secrets?
Sealed Secrets allows encrypted secret manifests to be stored in Git without exposing plaintext sensitive values.

### Why Kyverno?
Kyverno provides Kubernetes-native admission control to reject insecure workloads before they are admitted into the cluster.

## Limitations / Future Improvements
- Replace Sealed Secrets with External Secrets Operator if integrating with a cloud secret manager.
- Add image signature verification policy using Kyverno.
- Add Pod Security Standards restricted enforcement at namespace level.
- Add more granular RBAC validation tests.
