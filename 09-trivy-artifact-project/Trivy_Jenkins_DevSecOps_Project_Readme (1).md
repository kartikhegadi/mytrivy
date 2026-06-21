# ⚙️ Trivy + Jenkins Production DevSecOps Project

> **Prepared by:** InfraCorps Team
> **Organization:** InfraCorps

A complete hands-on DevSecOps project using **Trivy** with **Jenkins**.

---

## 📑 Table of Contents

1. [Features](#-features)
2. [Prerequisites](#-prerequisites)
3. [How It Works](#-how-it-works)
4. [Output Artifacts](#-output-artifacts)
5. [Use Cases](#-perfect-for)

---

## 🚀 Features

- 🐳 Docker image build
- 🛡️ Trivy image vulnerability scanning
- 📄 JSON vulnerability report
- 🌐 HTML security report
- 📦 SBOM generation (CycloneDX)
- 📥 Jenkins artifact archival

---

## ✅ Prerequisites

| Requirement | Notes |
|---|---|
| 🔧 Jenkins | With Docker + Shell access |
| 🐳 Docker | Required for image builds |
| 🛡️ Trivy | Installed on the Jenkins node |

---

## 🔄 How It Works

```text
+-------------------------------+
|   Jenkins Pulls Source Code  |
+---------------+---------------+
                |
                v
+-------------------------------+
|     Builds Docker Image      |
+---------------+---------------+
                |
                v
+-------------------------------+
|      Trivy Scans Image       |
+---------------+---------------+
                |
                v
+-------------------------------+
| Reports Generated & Archived |
+-------------------------------+
```

| Step | Action |
|---|---|
| 1 | Jenkins pulls source code |
| 2 | Builds Docker image |
| 3 | Trivy scans image |
| 4 | Reports generated and archived |

---

## 📦 Output Artifacts

| Artifact | Description |
|---|---|
| `reports/trivy-image.json` | Machine-readable vulnerability report |
| `reports/trivy-image.html` | Human-readable HTML security report |
| `reports/sbom.json` | Software Bill of Materials (CycloneDX format) |

---

## 🎯 Perfect For

- 📁 DevSecOps portfolio projects
- 🎥 YouTube demos
- 💼 Interview projects

---

## 📝 Document Info

| Field | Value |
|---|---|
| **Prepared By** | InfraCorps Team |
| **Company** | InfraCorps |
| **Topic** | Trivy + Jenkins DevSecOps Pipeline Project |
| **Audience** | DevOps / DevSecOps Engineers |
