# Task 3 - Service Mesh Security with Istio

## Objective

Implement service-to-service security controls using Istio Service Mesh by enabling Mutual TLS (mTLS), Authorization Policies, and Kubernetes Network Policies.

---

## Directory Structure

```text
task3-istio/
â”œâ”€â”€ mtls-strict.yaml
â”œâ”€â”€ deny-all.yml
â”œâ”€â”€ allow-reporting.yaml
â”œâ”€â”€ allow-all-to-ledger.yaml
â””â”€â”€ networkpolicy.yaml
```

---

## Step 1: Enable Strict Mutual TLS (mTLS)

### Configuration

File:

```text
task3-istio/mtls-strict.yaml
```

Apply:

```bash
kubectl apply -f task3-istio/mtls-strict.yaml
```

Verify:

```bash
kubectl get peerauthentication
```

### Screenshot Evidence

- task3-01-peerauthentication-strict.png
- task3-02-peerauthentication-yaml-strict.png

### Result

All service-to-service communication inside the namespace is encrypted and authenticated using Istio Mutual TLS.

---

## Step 2: Implement Authorization Policies

### Default Deny Policy

File:

```text
task3-istio/deny-all.yml
```

Apply:

```bash
kubectl apply -f task3-istio/deny-all.yml
```

This blocks all traffic by default.

---

### Allow Policy for Reporting Service

File:

```text
task3-istio/allow-reporting.yaml
```

Apply:

```bash
kubectl apply -f task3-istio/allow-reporting.yaml
```

Only authorized workloads can access the reporting service.

---

### Allow Policy for Ledger Service

File:

```text
task3-istio/allow-all-to-ledger.yaml
```

Apply:

```bash
kubectl apply -f task3-istio/allow-all-to-ledger.yaml
```

Allows required workloads to communicate with the ledger service.

---

### Verification

List policies:

```bash
kubectl get authorizationpolicy
```

Check service access:

```bash
curl ledger-api:8080
```

### Screenshot Evidence

- task3-03-authorizationpolicy-list.png
- task3-04-authorizationpolicy-yaml.png
- task3-05-authorizedaccess-reporting.png
- task3-06-unauthorizedaccess-denied.png

### Result

- Authorized requests succeed.
- Unauthorized requests are denied.

---

## Step 3: Implement Kubernetes Network Policy

### Configuration

File:

```text
task3-istio/networkpolicy.yaml
```

Apply:

```bash
kubectl apply -f task3-istio/networkpolicy.yaml
```

Verify:

```bash
kubectl get networkpolicy
```

### Screenshot Evidence

- task3-07-networkpolicy-yaml.png
- task3-08-networkpolicy.png

### Result

Network traffic between pods is restricted according to defined policy rules.

---

## Step 4: Verify Istio Authorization

Validation Command:

```bash
istioctl x authz check reporting
```

### Screenshot Evidence

- task3-09-istio-authz-check.png

### Result

Authorization policies are enforced correctly by Istio.

---

## Workload Identity and Certificate Management

Istio provides secure workload identity using X.509 certificates.

Features:

- Automatic certificate generation
- Automatic certificate rotation
- Strong workload authentication
- Secure service-to-service authorization
- Zero-trust networking model

Benefits:

- Encrypted communication
- Identity-based access control
- Reduced attack surface
- Improved service security

---

## Defense in Depth

This task combines multiple security controls:

### Istio Security

- Mutual TLS (mTLS)
- Workload Identity
- Authorization Policies

### Kubernetes Security

- Network Policies
- Pod-level traffic control

Together these controls provide layered security and protect communication between Kubernetes workloads.

---

## Screenshots

| Screenshot | Description |
|------------|-------------|
| task3-01-peerauthentication-strict.png | PeerAuthentication resource |
| task3-02-peerauthentication-yaml-strict.png | Strict mTLS YAML |
| task3-03-authorizationpolicy-list.png | Authorization Policies |
| task3-04-authorizationpolicy-yaml.png | AuthorizationPolicy YAML |
| task3-05-authorizedaccess-reporting.png | Authorized request |
| task3-06-unauthorizedaccess-denied.png | Unauthorized request denied |
| task3-07-networkpolicy-yaml.png | NetworkPolicy YAML |
| task3-08-networkpolicy.png | NetworkPolicy verification |
| task3-09-istio-authz-check.png | Istio authorization validation |

---

## Conclusion

Successfully implemented Service Mesh Security using Istio.

Completed:

- Strict Mutual TLS (mTLS)
- Authorization Policies
- Workload Identity Security
- Kubernetes Network Policies
- Service Access Validation

This implementation ensures encrypted communication, authenticated workloads, and controlled service access within the Kubernetes environment.
