# 🛡️ Trivy Installation on AWS EC2 (Ubuntu)

> **Prepared by:** InfraCorps Team
> **Organization:** InfraCorps

A beginner-friendly guide covering **what Trivy is**, **why it's used**, and **how to install it** on an AWS EC2 Ubuntu instance. All commands are explained step-by-step.

---

## 📑 Table of Contents

1. [What is Trivy?](#-what-is-trivy)
2. [Why Use Trivy?](#-why-use-trivy)
3. [Installation Steps](#-install-trivy-on-aws-ec2-ubuntu)
4. [Verifying the Installation](#-verify-installation)
5. [Running Your First Scan](#-run-your-first-scan)

---

## 🔍 What is Trivy?

**Trivy** is an open-source **security scanner** used in DevSecOps pipelines. It scans:

| Target | Description |
|---|---|
| 🐳 Docker Images | Scans container images for vulnerabilities |
| 📁 File Systems | Scans local directories and files |
| 🔧 Git Repositories | Scans repos for secrets and issues |
| ☸️ Kubernetes Clusters | Scans live cluster resources |
| 📋 SBOMs | Scans Software Bill of Materials |

### Trivy Detects:

- ✅ **Vulnerabilities (CVEs)**
- ✅ **Misconfigurations**
- ✅ **Secrets in code**
- ✅ **License issues**

It's lightweight, fast, and widely used in CI/CD security workflows.

---

## 💡 Why Use Trivy?

| Benefit | Description |
|---|---|
| 🔒 Pre-deployment security | Helps secure container images before deployment |
| ⚡ Early detection | Detects high-risk vulnerabilities early |
| 🔗 CI/CD integration | Works with GitHub Actions, Jenkins, GitLab, Azure DevOps |
| ☁️ Cloud-ready | Essential for DevSecOps and cloud security practices |

---

## ⚙️ Install Trivy on AWS EC2 (Ubuntu)

Run the following commands **one by one** on your EC2 instance.

### Step 1: Install Prerequisites

```bash
sudo apt-get install wget gnupg
```

> ✔️ Installs **wget** (used to download files) and **gnupg** (used for key verification).

---

### Step 2: Add Trivy's GPG Key

```bash
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
```

> ✔️ Downloads Aqua Security's **public GPG key**
> ✔️ Converts it to `.gpg` format
> ✔️ Saves it in `/usr/share/keyrings` so apt can trust the repository

---

### Step 3: Add the Trivy Repository

```bash
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
```

> ✔️ Adds the official **Trivy apt repository** to your system
> ✔️ Ensures all packages from it are verified using `trivy.gpg`

---

### Step 4: Update Package Index

```bash
sudo apt-get update
```

> ✔️ Refreshes the system package index
> ✔️ Allows apt to detect the newly added Trivy repository

---

### Step 5: Install Trivy

```bash
sudo apt-get install trivy
```

> ✔️ Installs Trivy on your system

---

## ✅ Verify Installation

```bash
trivy --version
```

If installed correctly, this will print the installed Trivy version.

---

## 🚀 Run Your First Scan

Scan a public Docker image, for example `nginx:latest`:

```bash
trivy image nginx:latest
```

🎉 **You're now ready to use Trivy for security scanning!**

---

## 📝 Document Info

| Field | Value |
|---|---|
| **Prepared By** | InfraCorps Team |
| **Company** | InfraCorps |
| **Topic** | AWS DevOps + Trivy Installation Guide |
| **Audience** | Beginners |
