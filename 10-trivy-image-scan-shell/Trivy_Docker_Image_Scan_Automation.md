# 🛡️ Trivy Docker Image Security Scan Automation

> **Prepared by:** InfraCorps Team
> **Organization:** InfraCorps

A **production-ready Bash script** to scan multiple Docker images for **HIGH** and **CRITICAL** vulnerabilities using **Trivy**, and generate **HTML vulnerability reports** automatically.

---

## 📑 Table of Contents

1. [Features](#-features)
2. [Project Structure](#-project-structure)
3. [Prerequisites](#-prerequisites)
4. [Input File](#-input-file-scan-imagestxt)
5. [Script Usage](#️-script-usage)
6. [What the Script Does](#-what-the-script-does)
7. [Sample Output](#-sample-output)
8. [Report Naming Logic](#-report-naming-logic)
9. [Security Scope](#-security-scope)
10. [CI/CD & Jenkins Ready](#-cicd--jenkins-ready)
11. [Best Practices](#-best-practices)

---

## 📌 Features

- ✅ Scans **multiple Docker images** from a single input file
- ✅ Uses **Trivy**, the industry-standard vulnerability scanner
- ✅ Generates **beautiful HTML reports**
- ✅ Filters only **HIGH & CRITICAL** vulnerabilities
- ✅ Fail-fast and safe Bash execution (`set -euo pipefail`)
- ✅ Ideal for **CI/CD, DevSecOps & Release Engineering**

---

## 📂 Project Structure

```text
.
├── scan-images.sh          # Main scanning script
├── scan-images.txt         # List of Docker images to scan
├── html.tpl                # Trivy HTML template (auto-downloaded)
├── reports/                # Generated HTML reports
│   ├── nginx_latest.html
│   ├── python_3.11.html
└── README.md
```

---

## 🧾 Prerequisites

Make sure the following tools are installed:

| Requirement | Notes |
|---|---|
| 🐳 Docker | Required to run scanned images |
| 🛡️ Trivy | Core vulnerability scanner |
| 🌐 wget | Used to download the HTML template |
| 🐧 Linux / macOS | Bash shell environment |

### Install Trivy (Ubuntu)

```bash
sudo apt-get update
sudo apt-get install -y wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install -y trivy
```

---

## 📄 Input File (`scan-images.txt`)

Add Docker images **one per line**:

```text
nginx:latest
python:3.11-slim
redis:7
amazonlinux:2
```

---

## ▶️ Script Usage

### Make the Script Executable

```bash
chmod +x scan-images.sh
```

### Run the Scan

```bash
./scan-images.sh
```

---

## 🧪 What the Script Does

| Step | Action |
|---|---|
| 1 | Validates required tools (`trivy`, `wget`) |
| 2 | Validates `scan-images.txt` |
| 3 | Downloads the Trivy HTML template (only once) |
| 4 | Scans each Docker image |
| 5 | Generates HTML reports per image |
| 6 | Saves reports inside the `/reports` folder |

---

## 📊 Sample Output

```text
🔍 Scanning: nginx:latest
✅ Report generated: reports/nginx_latest.html
--------------------------------------
🔍 Scanning: python:3.11
✅ Report generated: reports/python_3.11.html
--------------------------------------
All scans completed successfully
```

---

## 📁 Report Naming Logic

| Docker Image | HTML Report |
|---|---|
| `nginx:latest` | `nginx_latest.html` |
| `python:3.11` | `python_3.11.html` |
| `amazonlinux:2` | `amazonlinux_2.html` |

---

## 🔐 Security Scope

| Aspect | Detail |
|---|---|
| **Severity Filtered** | `HIGH`, `CRITICAL` |
| **Scan Type** | Image vulnerability scan |
| **Output Format** | HTML (shareable & audit-friendly) |

---

## 🚀 CI/CD & Jenkins Ready

This script can be directly integrated into:

- 🔧 Jenkins pipelines
- ⚡ GitHub Actions
- 🦊 GitLab CI
- ⏰ Cron jobs
- 📋 Release governance checks

---

## 🧠 Best Practices

- Run with a **cached Trivy DB** for faster scans
- Schedule scans daily using **cron**
- Archive HTML reports in CI artifacts
- Enforce blocking on **CRITICAL** findings in pipelines

---

## 📝 Document Info

| Field | Value |
|---|---|
| **Prepared By** | InfraCorps Team |
| **Company** | InfraCorps |
| **Topic** | Automated Trivy Docker Image Scanning (Bash Script) |
| **Audience** | DevOps / Release / DevSecOps Engineers |
