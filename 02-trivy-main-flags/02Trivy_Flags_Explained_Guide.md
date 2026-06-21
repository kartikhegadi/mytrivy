# 🛡️ Trivy Flags Explained — Full Guide with Commands & Sample Output

> **Prepared by:** InfraCorps Team
> **Organization:** InfraCorps

Using Trivy is easy, but controlling **what** it shows, **which vulnerabilities** matter, and **when** it should fail your CI/CD pipeline is where the real skill begins.

This guide explains the **3 most important Trivy flags** every beginner must understand.

---

## 📑 Table of Contents

1. [`--severity` — Filter by Importance](#1--severity-filter-by-importance)
2. [`--vuln-type` — OS or Library Vulnerabilities](#2--vuln-type-choose-os-or-library-vulnerabilities)
3. [`--exit-code` — Fail CI/CD Pipeline on Vulnerabilities](#3--exit-code-fail-cicd-pipeline-on-vulnerabilities)
4. [Summary](#-summary)

---

## 1. `--severity` (Filter by Importance)

By default, Trivy shows **all** vulnerabilities: `LOW`, `MEDIUM`, `HIGH`, `CRITICAL`.

If you only care about important issues, use `--severity` to filter results based on severity level.

### Example

```bash
trivy image --severity HIGH,CRITICAL python:3.10
```

### Sample Output

```text
Total: 12 (HIGH: 8, CRITICAL: 4)

CRITICAL: CVE-2023-12345
Package: openssl
Installed: 1.1.1-1
Fixed: 1.1.1-2

HIGH: CVE-2022-54321
Package: libc6
Installed: 2.31
Fixed: 2.32
```

### ✅ Benefits

- Reduces noise
- Highlights serious issues
- Helps in quick security reviews

---

## 2. `--vuln-type` (Choose OS or Library Vulnerabilities)

This flag lets you scope the scan to either **operating system** packages or **application library** dependencies.

### OS-only Vulnerabilities

```bash
trivy image --vuln-type os python:3.10
```

### Library-only Vulnerabilities

```bash
trivy image --vuln-type library python:3.10
```

### Sample Output (Library Only)

```text
CVE-2023-67890 (CRITICAL)
Package: requests (Python)
Installed: 2.25.0
Fixed: 2.31.0
```

---

## 3. `--exit-code` (Fail CI/CD Pipeline on Vulnerabilities)

By default, Trivy exits with code **0** (success) even if it finds vulnerabilities. But in CI/CD, we usually want a build to **fail** if serious issues exist.

### Why This Matters

| Purpose | Benefit |
|---|---|
| 🚫 Block deployments | Prevents vulnerable images from shipping |
| 🔍 Force review | Requires vulnerabilities to be checked before merge |
| 🔐 Strengthen DevSecOps | Builds a security-first culture in the pipeline |

### Fail Build if HIGH or CRITICAL Found

```bash
trivy image --severity HIGH,CRITICAL --exit-code 1 python:3.10
```

### Sample Output

```text
Found 3 HIGH vulnerabilities.
Exiting with code 1.
```

> ⚠️ The pipeline stops because exit code `1` signals failure.

---

## 📌 Summary

| Flag | Purpose |
|---|---|
| `--severity` | Filter important vulnerabilities |
| `--vuln-type` | Choose between OS vs Library scans |
| `--exit-code` | Fail CI/CD pipelines on security issues |

---

## 📝 Document Info

| Field | Value |
|---|---|
| **Prepared By** | InfraCorps Team |
| **Company** | InfraCorps |
| **Topic** | Trivy Flags & CI/CD Integration Guide |
| **Audience** | Beginners |
