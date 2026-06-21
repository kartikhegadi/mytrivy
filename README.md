# 🛡️ Trivy DevSecOps Learning Repository

![Trivy](https://img.shields.io/badge/Scanner-Trivy-1904DA?style=flat-square&logo=aquasecurity)
![DevSecOps](https://img.shields.io/badge/Practice-DevSecOps-2ea44f?style=flat-square)
![Docker](https://img.shields.io/badge/Container-Docker-2496ED?style=flat-square&logo=docker&logoColor=white)
![Jenkins](https://img.shields.io/badge/CI%2FCD-Jenkins-D24939?style=flat-square&logo=jenkins&logoColor=white)
![License](https://img.shields.io/badge/License-See%20LICENSE-blue?style=flat-square)

> **Author:** Kartik Hegadi
> **Organization:** InfraCorps

A complete, hands-on learning repository covering **Trivy** and container security scanning — from installation basics to a full Jenkins-based DevSecOps automation pipeline.

---

## 📑 Table of Contents

1. [Overview](#-overview)
2. [Folder Index](#-folder-index)
3. [Getting Started](#-getting-started)
4. [Recommended Learning Path](#-recommended-learning-path)
5. [License](#-license)

---

## 📌 Overview

This repository is organized as a **progressive, numbered series of modules** — each folder builds on the previous one, taking you from installing Trivy to running a production-style DevSecOps scanning pipeline.

It covers:

- Trivy installation and core flags
- Fixing real vulnerabilities in Docker images
- Alternative scanners (Grype, Docker Scout)
- HTML/JSON report generation
- Secret scanning
- Full automation with Bash scripts and Jenkins

---

## 📂 Folder Index

| # | Folder | Topic |
|---|---|---|
| 01 | `01-trivy-installation` | Installing Trivy on AWS EC2 (Ubuntu) |
| 02 | `02-trivy-main-flags` | Core Trivy flags: `--severity`, `--vuln-type`, `--exit-code` |
| 03 | `03-trivy-security-fix-local` | Scanning & fixing vulnerabilities in a local Docker image |
| 04 | `04-trivy-security-fix-dockerhub` | Scanning & fixing vulnerabilities in a Docker Hub image |
| 05 | `05-trivy-alternative` | Alternative scanners — Grype & Docker Scout |
| 06 | `06-trivy-report-generation` | Generating HTML vulnerability reports |
| 07 | `07-trivy-fs-demo` | Filesystem & secret scanning demo |
| 08 | `08-trivy-automation-shell` | Bash automation script for multi-image scanning |
| 09 | `09-trivy-artifact-project` | Trivy + Jenkins DevSecOps project (artifacts & SBOM) |
| 10 | `10-trivy-image-scan-shell` | Production image-scan shell script with HTML reports |

> 📄 `LICENSE` — Repository license
> 📄 `scriptfolder.sh` — Helper/setup script for the repo

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd <your-repo-name>
```

### 2. Navigate Into a Module

Each numbered folder is self-contained with its own `README.md` and any supporting files:

```bash
cd 01-trivy-installation
```

### 3. Install Prerequisites

Most modules require **Docker** and **Trivy** installed locally. Start with folder `01-trivy-installation` if you haven't installed Trivy yet.

### 4. Run Scripts (Where Applicable)

For automation modules (`08`, `09`, `10`), make scripts executable before running:

```bash
chmod +x scan-images.sh
./scan-images.sh
```

---

## 🧭 Recommended Learning Path

```text
01 → 02 → 03 → 04 → 05 → 06 → 07 → 08 → 09 → 10
```

| Stage | Folders | Focus |
|---|---|---|
| 🟢 Beginner | 01, 02 | Installation & core flags |
| 🟡 Intermediate | 03, 04, 05, 06, 07 | Fixing vulnerabilities, alternatives, reporting, secrets |
| 🔴 Advanced | 08, 09, 10 | Automation & CI/CD integration |

---

## 📜 License

See the [`LICENSE`](./LICENSE) file in this repository for details.

---

## 📝 Document Info

| Field | Value |
|---|---|
| **Author** | Kartik Hegadi |
| **Organization** | InfraCorps |
| **Repository Topic** | Trivy & DevSecOps Container Security Learning Path |
| **Audience** | DevOps / DevSecOps Engineers & Learners |
