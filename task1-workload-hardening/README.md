# Task 1 - Kubernetes Workload Hardening

## Objective

Deploy and secure the vulnerable ledger-api application using Kubernetes security best practices.

---

# Components Implemented

## ServiceAccount

Created a dedicated ServiceAccount:

```yaml
ledger-api-sa
```

Purpose:

- Avoid using default ServiceAccount
- Implement workload identity
- Follow least privilege principle

---

## RBAC

Implemented:

- Role
- RoleBinding

Permissions granted:

```yaml
configmaps:
- get
- list
```

Purpose:

- Restrict Kubernetes API access
- Prevent unnecessary permissions

---

## Container Hardening

Configured:

```yaml
runAsNonRoot: true
runAsUser: 1000

allowPrivilegeEscalation: false

readOnlyRootFilesystem: true

capabilities:
  drop:
  - ALL

seccompProfile:
  type: RuntimeDefault
```

Purpose:

- Prevent root execution
- Disable privilege escalation
- Restrict filesystem modifications
- Remove unnecessary privileges
- Reduce attack surface

---

## Resource Controls

Configured CPU and memory:

```yaml
requests:
  cpu: "100m"
  memory: "128Mi"

limits:
  cpu: "300m"
  memory: "256Mi"
```

Purpose:

- Prevent resource abuse
- Improve workload stability

---

## Health Checks

Implemented:

### Readiness Probe

Checks:

```text
/health
```

Purpose:

- Verify application is ready for traffic

### Liveness Probe

Checks:

```text
/health
```

Purpose:

- Automatically restart unhealthy containers

---

## ConfigMap

Created:

```yaml
ledger-api-config
```

Purpose:

- Store non-sensitive configuration
- Separate configuration from deployment

---

## Kubernetes Secret

Moved:

```text
STRIPE_API_KEY
DB_PASSWORD
```

from Deployment into Kubernetes Secret.

Purpose:

- Remove hardcoded secrets
- Improve credential management

---

## Sealed Secret

Implemented:

```yaml
SealedSecret
```

using:

```bash
kubeseal
```

Purpose:

- Encrypt secrets
- Store encrypted secrets safely in Git

---

## NGINX Ingress

Installed:

```text
NGINX Ingress Controller
```

Created:

```yaml
ledger-api-ingress
```

Purpose:

- External access to application
- Centralized traffic routing

---

## Kyverno Policies

Installed:

```text
Kyverno
```

Implemented:

### disallow-root

Blocks:

```yaml
runAsNonRoot: false
```

### disallow-latest

Blocks:

```yaml
image: latest
```

Purpose:

- Enforce workload security
- Enforce image version control

---

## Policy Enforcement Test

Created:

```yaml
bad-deployment.yaml
```

Containing:

```yaml
image: nginx:latest
```

without:

```yaml
runAsNonRoot: true
```

Result:

```text
Deployment rejected by Kyverno
```

This verified active policy enforcement.

---

# Security Controls Implemented

✅ Dedicated ServiceAccount

✅ RBAC

✅ Non-root Container

✅ Read-only Filesystem

✅ Disabled Privilege Escalation

✅ Dropped Linux Capabilities

✅ RuntimeDefault Seccomp

✅ Resource Limits

✅ Readiness Probe

✅ Liveness Probe

✅ ConfigMap

✅ Kubernetes Secret

✅ Sealed Secret

✅ NGINX Ingress

✅ Kyverno Policies

✅ Policy Rejection Test

---

# Evidence

Refer:

```text
screenshots/task1/
```

for implementation screenshots and validation evidence.

---

# Final Result

