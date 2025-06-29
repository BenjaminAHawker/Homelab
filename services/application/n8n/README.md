# 🏡 Hawk Home — n8n Service <img src="../../../assets/img/n8n-logo.png" alt="n8n logo" width="64" style="border-radius: 12px;">

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)

This folder contains the `n8n` workflow automation service as part of the **Hawk Home** homelab. It uses Docker Compose and a PostgreSQL backend for persistence.

This setup:
- Loads environment variables from a local `.env` file
- Stores all persistent data in `./data/`
- Separates n8n and PostgreSQL cleanly
- Is compatible with reverse proxies like Nginx Proxy Manager

---

## 📁 Directory Structure

```plaintext
n8n/
├── docker-compose.yaml
├── .env                   # Required environment config
└── data/
    ├── n8n/               # n8n persistent storage
    └── postgres/          # PostgreSQL data volume
```

## 🔧 Setup Instructions

Before running the containers, use the provided setup script to create the required folders and apply the correct ownership for Docker volumes.

1. Run the Setup Script (as root)

```bash
cd services/n8n
chmod +x setup.sh
./setup.sh
```
- Creates ./data/n8n and ./data/postgres</br>
- Applies chown -R 1000:1000 data/ so containers have proper access

🧑‍💻 This script is intended to be run as root. If you’re not root, prepend with sudo.

## ⚙️ Environment Configuration

All secrets and hostnames are defined in the .env file.

```env
N8N_DB_HOST=n8n-db
N8N_DB_PORT=5432
N8N_DB_NAME=n8n
N8N_DB_USER=n8n
N8N_DB_PASSWORD=changeme_db_password

N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=changeme_admin_password

N8N_HOST=n8n.local
N8N_PORT=5678
N8N_WEBHOOK_URL=https://your-domain.example.com/
N8N_TIMEZONE=UTC
```
⚠️ Rename to .env and do not commit it to source control.

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:

- Start n8n and n8n-db</br>
- Mount all persistent data to ./data/</br>
- Load secure config from .env</br>

## 🛑 Stop the Service
```bash
docker compose down
```

## 🔄 Backup Notes
- All n8n configuration and workflows are stored in ./data/n8n/
- PostgreSQL data is stored in ./data/postgres/
- You can archive the whole data/ folder for backups

## 🧠 About n8n

[n8n](https://n8n.io) is a powerful, node-based workflow automation tool. It enables no-code/low-code integrations between APIs, scripts, and systems.

- 🌐 Website: [https://n8n.io](https://n8n.io)
- 📦 GitHub: [n8n-io/n8n](https://github.com/n8n-io/n8n)


## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.