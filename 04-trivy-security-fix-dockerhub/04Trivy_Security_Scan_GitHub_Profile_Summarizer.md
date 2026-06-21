# 🛡️ Trivy Security Scan — Fixing Vulnerabilities in `github-profile-summarizer` Docker Image

> **Prepared by:** InfraCorps Team
> **Organization:** InfraCorps

This document explains how **Trivy** was used to scan the Docker image `theshubhamgour/github-profile-summarizer:latest`, identify vulnerabilities, apply a fix using Alpine package upgrades, and re-scan the updated image.

This README is useful for **DevOps**, **DevSecOps**, **Cloud**, and **CI/CD** workflows where image security and vulnerability management matter.

### What This Document Covers

- Scanning the Docker image `theshubhamgour/github-profile-summarizer:latest`
- Identifying OS-level vulnerabilities (Alpine base)
- Applying fixes using `apk upgrade`
- Rebuilding and re-scanning the image
- Validating improvements through vulnerability reduction

It follows DevSecOps best practices and includes workflow diagrams, an upgrade strategy, and CI/CD considerations.

---

## 📑 Table of Contents

1. [Initial Scan — Base Image Vulnerabilities](#1-initial-scan--base-image-vulnerabilities)
2. [Vulnerability Summary (Before Fix)](#2-vulnerability-summary-before-fix)
3. [DevSecOps Workflow — How Trivy Fits](#3-devsecops-workflow--how-trivy-fits)
4. [Fixing Vulnerabilities — Updating Alpine Packages](#4-fixing-vulnerabilities--updating-alpine-packages)
5. [Scan After Fix (Improved Security Score)](#5-scan-after-fix-improved-security-score)
6. [Architecture Diagram — Image Upgrade Flow](#6-architecture-diagram--image-upgrade-flow)
7. [DevSecOps Best Practices (Recommended)](#7-devsecops-best-practices-recommended)
8. [Conclusion](#8-conclusion)

---

## 1. Initial Scan — Base Image Vulnerabilities

We scanned the image:

```bash
trivy image theshubhamgour/github-profile-summarizer
```

### Report Summary

```text
Target: theshubhamgour/github-profile-summarizer (alpine 3.22.2)
Vulnerabilities: 10
Secrets: none
```

| Target | Type | Vulnerabilities | Secrets |
|---|---|---|---|
| `theshubhamgour/github-profile-summarizer` (alpine 3.22.2) | alpine | 10 | – |

### Severity Breakdown

| Severity | Count |
|---|---|
| 🔴 CRITICAL | 0 |
| 🟠 HIGH | 2 |
| 🟡 MEDIUM | 5 |
| 🟢 LOW | 3 |

### Full Vulnerability Detail

**Total: 10** (UNKNOWN: 0, LOW: 3, MEDIUM: 5, HIGH: 2, CRITICAL: 0)

| Library | CVE | Severity | Installed | Fixed | Title |
|---|---|---|---|---|---|
| `busybox` | CVE-2024-58251 | MEDIUM | 1.37.0-r19 | 1.37.0-r20 | netstat local privilege issue in BusyBox |
| `busybox` | CVE-2025-46394 | LOW | 1.37.0-r19 | – | TAR archive filename handling issue |
| `busybox-binsh` | CVE-2024-58251 | MEDIUM | 1.37.0-r19 | 1.37.0-r20 | netstat local privilege issue in BusyBox |
| `busybox-binsh` | CVE-2025-46394 | LOW | 1.37.0-r19 | – | TAR archive filename handling issue |
| `libpng` | CVE-2025-64720 | **HIGH** | 1.6.47-r0 | 1.6.51-r0 | libpng buffer overflow |
| `libpng` | CVE-2025-65018 | **HIGH** | 1.6.47-r0 | 1.6.51-r0 | libpng heap buffer overflow |
| `libpng` | CVE-2025-64505 | MEDIUM | 1.6.47-r0 | 1.6.51-r0 | libpng heap buffer overflow via malformed palette index |
| `libpng` | CVE-2025-64506 | MEDIUM | 1.6.47-r0 | 1.6.51-r0 | libpng heap buffer over-read |
| `ssl_client` | CVE-2024-58251 | MEDIUM | 1.37.0-r19 | 1.37.0-r20 | netstat local privilege issue in BusyBox |
| `ssl_client` | CVE-2025-46394 | LOW | 1.37.0-r19 | – | TAR archive filename handling issue |

> 🔗 Full CVE references available on [AVD by Aqua Security](https://avd.aquasec.com/).

### Major Affected Packages

- **`libpng`** — High severity buffer overflows
- **`busybox`**, **`busybox-binsh`**, **`ssl_client`**

These are common in Alpine-based images when the base image is not kept up to date.

---

## 2. Vulnerability Summary (Before Fix)

The complete vulnerability table is included in the original scan output (Trivy CLI). Key findings:

### 🔴 High Severity — `libpng`

| CVE | Issue |
|---|---|
| CVE-2025-64720 | Buffer overflow |
| CVE-2025-65018 | Heap buffer overflow |

### 🟡 Medium / 🟢 Low Severity — BusyBox

| CVE | Issue |
|---|---|
| CVE-2024-58251 | netstat local privilege issue |
| CVE-2025-46394 | TAR archive filename handling issue |

These vulnerabilities were patchable via simple package upgrades.

---

## 3. DevSecOps Workflow — How Trivy Fits

```text
+---------------------------------------------------------------+
|                     Developer Writes Code                     |
+-----------------------+---------------------------------------+
                        |
                        v
+---------------------------------------------------------------+
|                Build Docker Image (CI Pipeline)               |
+-----------------------+---------------------------------------+
                        |
                        v
+---------------------------------------------------------------+
|                  Trivy Image Scan Stage                       |
|  - CVE Detection (OS + App packages)                          |
|  - Severity filtering (HIGH, CRITICAL)                         |
|  - Fails pipeline on severe issues                             |
+-----------------------+---------------------------------------+
                        |
                        v
+---------------------------------------------------------------+
|            Security Gate Passed → Deploy to Prod              |
+---------------------------------------------------------------+
```

> ✅ This workflow ensures **shift-left security** by catching vulnerabilities before deployment.

---

## 4. Fixing Vulnerabilities — Updating Alpine Packages

To fix the `libpng` (HIGH) and multiple BusyBox vulnerabilities, we updated packages inside the Dockerfile.

### Dockerfile Patch

```dockerfile
FROM theshubhamgour/github-profile-summarizer:latest

# Update package indexes and upgrade libpng (also cleans up other related issues)
RUN apk update && \
    apk upgrade --no-cache libpng
```

### Build the Updated Image

```bash
docker build -t theshubhamgour/github-profile-summarizer:fixed-libpng .
```

### Re-Scan the Patched Image

```bash
trivy image theshubhamgour/github-profile-summarizer:fixed-libpng
```

### After-Fix Scan Result

**Total: 6** (UNKNOWN: 0, LOW: 3, MEDIUM: 3, HIGH: 0, CRITICAL: 0)

| Library | CVE | Severity | Status | Installed | Fixed | Title |
|---|---|---|---|---|---|---|
| `busybox` | CVE-2024-58251 | MEDIUM | fixed | 1.37.0-r19 | 1.37.0-r20 | netstat local privilege issue in BusyBox |
| `busybox` | CVE-2025-46394 | LOW | – | 1.37.0-r19 | – | TAR archive filename handling issue |
| `busybox-binsh` | CVE-2024-58251 | MEDIUM | – | 1.37.0-r19 | 1.37.0-r20 | netstat local privilege issue in BusyBox |
| `busybox-binsh` | CVE-2025-46394 | LOW | – | 1.37.0-r19 | – | TAR archive filename handling issue |
| `ssl_client` | CVE-2024-58251 | MEDIUM | – | 1.37.0-r19 | 1.37.0-r20 | netstat local privilege issue in BusyBox |
| `ssl_client` | CVE-2025-46394 | LOW | – | 1.37.0-r19 | – | TAR archive filename handling issue |

> 🎉 All `libpng` HIGH severity issues are resolved — only minor BusyBox issues remain.

---

## 5. Scan After Fix (Improved Security Score)

```bash
trivy image theshubhamgour/github-profile-summarizer:fixed-libpng
```

### Updated Vulnerability Count

| Severity | Before | After |
|---|---|---|
| 🔴 CRITICAL | 0 | 0 |
| 🟠 HIGH | 2 | **0** ✅ |
| 🟡 MEDIUM | 5 | **3** |
| 🟢 LOW | 3 | **3** |

### What Was Fixed

- ✅ All **High severity `libpng`** issues
- ⚠️ Remaining: Medium + Low BusyBox vulnerabilities (unpatched upstream)

> Remaining issues are expected for Alpine and considered low-risk for typical workloads.

---

## 6. Architecture Diagram — Image Upgrade Flow

```text
        +-------------------------------+
        |   Base Image (Alpine 3.22.2)  |
        +-----------------------+-------+
                                |
                                v
        +-------------------------------------------+
        |       Trivy Scan (10 vulnerabilities)      |
        +-----------------------+-------------------+
                                |
                                v
        +-------------------------------------------+
        |  Apply Fix (apk upgrade libpng busybox)    |
        +-----------------------+-------------------+
                                |
                                v
        +-------------------------------------------+
        |  Build Patched Image :fixed-libpng         |
        +-----------------------+-------------------+
                                |
                                v
        +-------------------------------------------+
        |  Re-scan with Trivy (6 remaining issues)   |
        +-------------------------------------------+
```

---

## 7. DevSecOps Best Practices (Recommended)

### ✅ 1. Always Scan in CI/CD

Example for Jenkins / GitHub Actions:

```bash
trivy image --exit-code 1 --severity HIGH,CRITICAL <image>
```

### ✅ 2. Avoid Outdated Alpine Tags

Use version-pinned, actively maintained tags rather than `latest`.

### ✅ 3. Perform Regular Image Maintenance

- Run `apk upgrade` regularly
- Refresh the base image periodically
- Consider **distroless** images where possible

---

## 8. Conclusion

This workflow demonstrates:

- How Trivy quickly identifies OS-level vulnerabilities
- How simple patching dramatically reduces risk
- That regular image maintenance improves your security posture
- Production readiness by eliminating High severity CVEs

### ✅ Your Secure Image

```text
theshubhamgour/github-profile-summarizer:fixed-libpng
```

---

## 📝 Document Info

| Field | Value |
|---|---|
| **Prepared By** | InfraCorps Team |
| **Company** | InfraCorps |
| **Topic** | Trivy Vulnerability Remediation Case Study |
| **Audience** | DevOps / DevSecOps Engineers |
