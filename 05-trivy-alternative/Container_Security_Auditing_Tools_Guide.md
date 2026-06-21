# 🔐 Container Security Auditing Tools

> **Prepared by:** InfraCorps Team
> **Organization:** InfraCorps

A quick-start guide for using **Grype** and **Docker Scout** as alternatives to Trivy for scanning container images.

---

## 📑 Table of Contents

1. [Prerequisites](#-prerequisites)
2. [Grype (by Anchore)](#1--grype-by-anchore)
3. [Docker Scout](#2--docker-scout)
4. [Which One Should You Use?](#-key-benefits-which-one-to-use)

---

## ✅ Prerequisites

| Requirement | Purpose |
|---|---|
| 🍺 Homebrew | For macOS installation |
| 🐳 Docker Desktop | Must be running locally |
| 🪪 Docker Hub Account | Required for Scout authentication |

---

## 1. 🚀 Grype (by Anchore)

**Grype** is a vulnerability scanner for container images and filesystems, known for its **speed** and ease of use in CI/CD pipelines.

🔗 GitHub: [github.com/anchore/grype](https://github.com/anchore/grype)

### Installation

On macOS, install via Homebrew:

```bash
brew install grype
```

### Usage

Scan the `python:3.10-slim` image and view all detected vulnerabilities:

```bash
grype python:3.10-slim
```

---

## 2. 🐳 Docker Scout

**Docker Scout** is a native security tool integrated directly into the Docker ecosystem. It doesn't just find vulnerabilities — it provides **detailed remediation advice** and recommendations for base image upgrades.

📖 Documentation: [docs.docker.com/scout](https://docs.docker.com/scout/)

### Authentication

Before using Scout, you must be logged into your Docker account:

```bash
docker login
```

### Usage

#### A. High-Level Summary

Get a "Quickview" of the image's security posture, including a summary of vulnerabilities and how it compares to the base image:

```bash
docker scout quickview python:3.10-slim
```

#### B. Detailed CVE List

See the full list of Common Vulnerabilities and Exposures (CVEs) found in the image:

```bash
docker scout cves python:3.10-slim
```

---

## 🤔 Key Benefits: Which One to Use?

Both Grype and Docker Scout are excellent alternatives to Trivy, but they serve slightly different purposes depending on your priorities.

| Criteria | 🚀 Grype | 🐳 Docker Scout |
|---|---|---|
| **Speed** | ⚡ Fastest option for CI/CD pipelines | Slightly slower, more detailed |
| **Cost / Access** | 100% free, open source, no account needed | Requires Docker Hub account |
| **Offline Use** | ✅ Works fully offline once DB is downloaded | ❌ Requires Docker ecosystem connectivity |
| **SBOM Integration** | ✅ Integrates with Syft & SBOM ecosystem | ❌ Not SBOM-focused |
| **Remediation Advice** | Lists vulnerabilities only | ✅ Suggests exact fixed base image versions |
| **Visual Dashboard** | ❌ CLI-only | ✅ Docker Desktop & Hub UI integration |

### ✅ Use Grype if:

- **Speed is your priority** — you need the fastest possible scan in a CI/CD pipeline
- **You want open source** — a tool that's 100% free, requires no account, and works fully offline once the database is downloaded
- **You use SBOMs** — you're already using tools like Syft and want a scanner that integrates perfectly with the Software Bill of Materials ecosystem

### ✅ Use Docker Scout if:

- **You need a "fix" plan** — you don't just want a list of bugs, you want Docker to tell you exactly which base image (e.g., `python:3.10.15-slim`) will fix them
- **You want built-in convenience** — you're already using Docker Desktop and Docker Hub and want a security dashboard that's already "just there"
- **You're a visual person** — you prefer "Quickview" summaries and seeing your security posture directly within the Docker Desktop app or Hub UI

---

## 📝 Document Info

| Field | Value |
|---|---|
| **Prepared By** | InfraCorps Team |
| **Company** | InfraCorps |
| **Topic** | Grype & Docker Scout — Container Security Scanning |
| **Audience** | DevOps / DevSecOps Engineers |
