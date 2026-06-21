# 🔐 Trivy Secret Scanning — Sample Secrets Demo (Safe for Testing)

> **Prepared by:** InfraCorps Team
> **Organization:** InfraCorps

> ⚠️ **IMPORTANT DISCLAIMER**
> All examples in this repository are **FAKE / DUMMY secrets** created **only for learning, demos, and Trivy scans**.
> - ❌ Do **NOT** use real credentials here
> - ❌ Do **NOT** commit real secrets to GitHub

---

## 📑 Table of Contents

1. [Purpose of This README](#-purpose-of-this-readme)
2. [Sample Secret Types](#-sample-secret-types)
3. [How to Scan Secrets Using Trivy](#-how-to-scan-secrets-using-trivy)
4. [Typical Trivy Output](#-typical-trivy-output-what-youll-see)
5. [Real-World Usage](#-real-world-usage)
6. [Best Practices (Production)](#-best-practices-production)
7. [Final Note](#-final-note)

---

## 🎯 Purpose of This README

This README helps you understand:

- What **secret types** Trivy can detect
- How secrets **look in real projects**
- Why committing them is dangerous
- How Trivy flags them during secret scanning

This is commonly used for:

- DevSecOps demos
- Training videos
- CI/CD security testing
- Learning Trivy secret detection

---

## 🔑 Sample Secret Types

### 1. AWS Access Keys

```text
AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

| | |
|---|---|
| **Why risky** | Grants direct access to AWS resources; can lead to cloud takeover if leaked |
| **How Trivy detects** | Known AWS key patterns |

---

### 2. GitHub Personal Access Token

```text
GITHUB_TOKEN=ghp_1234567890abcdef1234567890abcdef1234
```

| | |
|---|---|
| **Why risky** | Allows repo access, code push, and secret reading |
| **How Trivy detects** | GitHub token prefix patterns (`ghp_`, `github_pat_`) |

---

### 3. Generic Password

```text
DB_PASSWORD=SuperSecurePassword123!
```

| | |
|---|---|
| **Why risky** | Often reused across environments; easy target for brute-force or leaks |
| **How Trivy detects** | Common variable name patterns (`PASSWORD`, `PASS`, `PWD`) |

---

### 4. Private Key (SSH / RSA)

```text
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAuFakeKeyExampleOnlyDontUseInProd
s7C3a1xExampleKeyMaterialOnly
-----END RSA PRIVATE KEY-----
```

| | |
|---|---|
| **Why risky** | Direct server or Git access; full compromise if exposed |
| **How Trivy detects** | PEM / key block signatures |

---

### 5. High-Entropy Strings (JWT Secret)

```text
JWT_SECRET=YWRtaW5TdXBlclNlY3JldEtleTEyMzQ1NiEhIQ==
```

or

```text
JWT_SECRET=KJH#9a$2!FJd93k@LQw9s0XzPpVb
```

| | |
|---|---|
| **Why risky** | Used to sign authentication tokens; can allow auth bypass |
| **How Trivy detects** | Entropy-based detection (random-looking strings) |

---

## 🔍 How to Scan Secrets Using Trivy

Scan for secrets only:

```bash
trivy fs --scanners secret .
```

Or include vulnerabilities **and** secrets:

```bash
trivy fs .
```

---

## 📊 Typical Trivy Output (What You'll See)

| Field | Description |
|---|---|
| Secret Type | e.g., AWS, GitHub, Private Key |
| File Path | Location of the file containing the secret |
| Line Number | Exact line where the secret was found |
| Severity | Risk level assigned to the finding |
| Detection Rule | The rule/pattern used to flag it |

---

## 🧠 Real-World Usage

In real DevSecOps pipelines, secret scanning is used to:

- 🚫 Block PRs with leaked secrets
- 🔍 Scan repositories before deployment
- 📋 Enforce compliance & security policies
- 🔒 Protect cloud & production systems

---

## ✅ Best Practices (Production)

- [x] Use environment variables
- [x] Store secrets in a dedicated secrets manager:
  - AWS Secrets Manager
  - HashiCorp Vault
  - Azure Key Vault
- [x] Rotate leaked secrets immediately
- [ ] ❌ Never hardcode secrets

---

## 📌 Final Note

> These examples exist **only to demonstrate Trivy secret detection**. Real secrets should **never** appear in source code or version control.

---

🚀 **Happy Secure Scanning!**

---

## 📝 Document Info

| Field | Value |
|---|---|
| **Prepared By** | InfraCorps Team |
| **Company** | InfraCorps |
| **Topic** | Trivy Secret Scanning Demo (Sample Secrets) |
| **Audience** | DevOps / DevSecOps Engineers |
