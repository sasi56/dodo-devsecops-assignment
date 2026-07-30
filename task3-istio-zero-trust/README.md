# Task 3 - Service Mesh & Zero Trust with Istio

## Objective
The objective of this task is to implement service-to-service zero-trust networking using Istio and Kubernetes NetworkPolicy.

## What Was Implemented

### 1. Istio Service Mesh
The ledger-api workload and neighbour/reporting service were brought into the Istio service mesh using sidecar injection.

### 2. mTLS STRICT Mode
Istio PeerAuthentication was configured to enforce STRICT mutual TLS for workloads in the namespace.

Manifest:

- mtls-strict.yaml

### 3. Default Deny AuthorizationPolicy
A default deny policy was added so that no service can access ledger-api unless explicitly allowed.

Manifest:

- deny-all.yml

### 4. Explicit Allow Policy
An explicit allow policy was added to permit only the authorized workload/service account to access ledger-api.

Manifests:

- allow-reporting.yaml
- allow-all-to-ledger.yaml

### 5. Kubernetes NetworkPolicy
A Kubernetes NetworkPolicy was added underneath Istio authorization as defense-in-depth.

Manifest:

- networkpolicy.yaml

## Files

| File | Purpose |
|---|---|
| mtls-strict.yaml | Enforces Istio mTLS STRICT mode |
| deny-all.yml | Default deny AuthorizationPolicy |
| allow-reporting.yaml | Allows authorized reporting workload |
| allow-all-to-ledger.yaml | Allow policy used for validation/testing |
| networkpolicy.yaml | Kubernetes NetworkPolicy for additional segmentation |

## Evidence

Screenshots are available at:

- ../screenshots/task3/task3-01-peerauthentication-strict.png
- ../screenshots/task3/task3-02-peerauthentication-yaml-strict.png
- ../screenshots/task3/task3-03-authorizationpolicy-list.png
- ../screenshots/task3/task3-04-authorizationpolicy-yaml.png
- ../screenshots/task3/task3-05-authorizedaccess-reporting'.png
- ../screenshots/task3/task3-06-unauthorizedaccess-denied.png
- ../screenshots/task3/task3-07-networkpolicy-yaml.png
- ../screenshots/task3/task3-08-networkpolicy.png
- ../screenshots/task3/task3-09-istio-authz-check.png

## Design Decisions

### Why mTLS STRICT?
mTLS STRICT ensures service-to-service traffic inside the mesh is encrypted and authenticated. Plaintext traffic should not be accepted between meshed workloads.

### Why AuthorizationPolicy?
AuthorizationPolicy provides identity-based access control using workload identity instead of relying only on IP addresses.

### Why default deny?
A default deny model follows zero-trust principles. Access must be explicitly allowed.

### Why NetworkPolicy also?
Istio AuthorizationPolicy controls application/service identity access, while Kubernetes NetworkPolicy provides network-level segmentation. Using both gives defense-in-depth.

## Trust and Certificate Model
Istio issues workload certificates to sidecars through its control plane. These certificates are used to establish mutual TLS between workloads in the mesh. Workload identity is based on Kubernetes ServiceAccount identity.

## Limitations / Future Improvements
- Add Istio Ingress Gateway with TLS termination.
- Add canary release using VirtualService and DestinationRule.
- Add screenshots for istioctl authn tls-check output if not already captured.
- Map mesh boundaries clearly to PCI/CDE scope in an architecture diagram.
