# 🐳 Scanning Docker Images Locally — Real-World Demo

> **Prepared by:** InfraCorps Team
> **Organization:** InfraCorps

A beginner-friendly, hands-on guide to scanning Docker images locally using **Trivy**, understanding caching behavior, and fixing common vulnerabilities.

---

## 📑 Table of Contents

1. [Overview](#-overview)
2. [Build the Local Docker Image](#-1-build-the-local-docker-image)
3. [Scan the Image Using Trivy](#-2-scan-the-image-using-trivy)
4. [Trivy Caching Locations](#-3-trivy-caching-locations)
5. [Fixing Vulnerabilities](#-4-fixing-vulnerabilities)
6. [Example Scan Output](#-5-example-scan-output)

---

## 📌 Overview

Learn how to scan Docker images locally using Trivy, understand caching, and fix common vulnerabilities.

### 📁 Included Files

| File | Description |
|---|---|
| `Dockerfile` | The clean, production-ready Dockerfile |
| `Dockerfile.issue` | A Dockerfile intentionally containing vulnerabilities |
| `app.py` | Sample application used for the demo |
| `README.md` | This guide |

---

## 🚀 1. Build the Local Docker Image

```bash
docker build -t myapp:latest .
```

> ✔️ Builds a local Docker image tagged `myapp:latest` from your Dockerfile.

---

## 🛡️ 2. Scan the Image Using Trivy

```bash
trivy image myapp:latest
```

> ✔️ Scans the built image for OS and library vulnerabilities, misconfigurations, and exposed secrets.

### 🔁 Alternative Example — Scanning a Different Image

```bash
trivy image node:18-alpine
```

> Useful when comparing vulnerability counts across base images (e.g., Alpine vs. Slim vs. Debian-based).

---

## ⚡ 3. Trivy Caching Locations

Trivy caches its vulnerability database locally to speed up repeated scans.

| OS | Cache Path |
|---|---|
| 🍎 macOS | `~/Library/Caches/trivy` |
| 🐧 Linux | `~/.cache/trivy` |

### 🧹 Clearing the Cache (Optional)

```bash
trivy image --clear-cache
```

> Useful when you want to force a fresh vulnerability database download.

---

## 🔧 4. Fixing Vulnerabilities

A secure, minimal Dockerfile example:

```dockerfile
FROM python:3.10-slim
RUN pip install --upgrade pip
RUN pip install flask
COPY app.py .
CMD ["python", "app.py"]
```

### Rebuild the Secure Image

```bash
docker build -t myapp:secure .
```

### 🔁 Alternative Example — Multi-Stage Build for Extra Hardening

```dockerfile
FROM python:3.10-slim AS builder
WORKDIR /app
COPY app.py .
RUN pip install --upgrade pip && pip install flask

FROM python:3.10-slim
WORKDIR /app
COPY --from=builder /app /app
RUN useradd -m appuser
USER appuser
CMD ["python", "app.py"]
```

> ✔️ Reduces final image size and runs the app as a **non-root user** — a common Trivy misconfiguration fix.

---

## 📊 5. Example Scan Output

**Before fixing (vulnerable image):**

```text
Total: 42 (LOW: 30, MEDIUM: 10, HIGH: 2, CRITICAL: 0)
```

**After fixing (secure image):**

```text
Total: 6 (LOW: 5, MEDIUM: 1, HIGH: 0, CRITICAL: 0)
```

> 📉 A visible drop in vulnerabilities after switching to a slimmer base image and applying fixes.

---

## 📝 Document Info

| Field | Value |
|---|---|
| **Prepared By** | InfraCorps Team |
| **Company** | InfraCorps |
| **Topic** | Local Docker Image Scanning with Trivy |
| **Audience** | Beginners |
