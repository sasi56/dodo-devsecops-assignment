# Dodo Payments - Attack Surface Reconnaissance Report

## Scope

Target Domain: dodopayments.tech

Assessment Type: Passive OSINT Reconnaissance

No active exploitation, fuzzing, or vulnerability scanning was performed.

---

## Subdomain Discovery

Tools Used:
- Subfinder
- Assetfinder

Results:
- Subfinder: 123 subdomains
- Assetfinder: 53 subdomains
- Unique Subdomains Identified: 124

---

## Live Host Discovery

Tool Used:
- httpx

Results:
- Total Live Hosts: 48

---

## Technology Fingerprinting

Tool Used:
- WhatWeb

Observed Technologies:
- Cloudflare
- Astro v5.18.0
- Google Analytics
- HTTP/2
- HSTS
- Content Security Policy
- X-Frame-Options
- X-XSS-Protection

Observations:
- Cloudflare appears to protect the origin infrastructure.
- Modern frontend technology stack identified.
- Security headers are partially implemented.

---

## TLS Security Assessment

Tool Used:
- testssl.sh

Supported Protocols:
- TLS 1.2
- TLS 1.3
- TLS 1.0 (deprecated)
- TLS 1.1 (deprecated)

Certificate:
- Valid certificate issued by Google Trust Services.
- Certificate Transparency enabled.

Positive Findings:
- SSLv2 disabled
- SSLv3 disabled
- Forward Secrecy enabled
- Heartbleed not vulnerable
- ROBOT not vulnerable
- DROWN not vulnerable
- FREAK not vulnerable

Findings:
- TLS 1.0 enabled
- TLS 1.1 enabled
- SWEET32 vulnerability reported
- BEAST vulnerability reported due to TLS 1.0 support
- LUCKY13 potentially vulnerable due to CBC cipher support

SSL/TLS Grade:
- B

---

## Risk Observations

### Medium Risk

Legacy TLS 1.0 and TLS 1.1 protocols remain enabled.

### Medium Risk

Legacy CBC and 3DES cipher suites are supported, resulting in SWEET32 and LUCKY13 findings.

### Low Risk

Technology stack information is publicly exposed and can aid attacker reconnaissance.

---

## Recommendations

1. Disable TLS 1.0.
2. Disable TLS 1.1.
3. Remove 3DES cipher suites.
4. Remove legacy CBC cipher suites.
5. Allow only TLS 1.2 and TLS 1.3.
6. Review exposed subdomains and remove unused services.

---

## Conclusion

A total of 124 unique subdomains were identified, of which 48 hosts were reachable. The organization demonstrates generally strong security controls through Cloudflare protection, valid certificates, and modern TLS support. However, support for legacy protocols and cipher suites reduces the overall security posture and results in a TLS grade of B.
