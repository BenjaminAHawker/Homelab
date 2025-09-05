<p align="center">
  <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
  &nbsp;&nbsp;&nbsp;
  <strong style="font-size: 1.5em;">Hawk Home — Gotify Service</strong>
  &nbsp;&nbsp;&nbsp;
  <img src="../../../assets/img/gotify-logo.png" alt="Gotify Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)
![Stack](https://img.shields.io/badge/stack-Core-orange?style=flat-square)

This folder contains the **Gotify push notification service** as part of the **Hawk Home** homelab. It uses Docker Compose and a PostgreSQL backend for persistence.

This setup:
- Loads environment variables from a local `.env` file
- Stores all persistent data in `./data/`
- Separates Gotify and PostgreSQL cleanly
- Is compatible with reverse proxies like Nginx Proxy Manager

---

## 📁 Directory Structure

```plaintext
gotify/
├── docker-compose.yaml
├── .env                   # Required environment config
└── data/
    ├── gotify/               # Gotify persistent storage
    └── postgres/          # PostgreSQL data volume
```

## 🔧 Setup Instructions

Before running the containers, use the provided setup script to create the required folders and apply the correct ownership for Docker volumes.

1. Run the Setup Script (as root)

```bash
cd services/gotify
chmod +x setup.sh
./setup.sh
```
- Creates ./data/gotify and ./data/postgres</br>
- Applies chown -R 1000:1000 data/ so containers have proper access

🧑‍💻 This script is intended to be run as root. If you’re not root, prepend with sudo.

## ⚙️ Environment Configuration

All secrets and hostnames are defined in the .env file.

```env
POSTGRES_DB=
POSTGRES_USER=
POSTGRES_PASSWORD=
POSTGRES_HOST=
POSTGRES_PORT=

GOTIFY_PORT=
TZ=
```
⚠️ Rename to .env and do not commit it to source control.

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:

- Start Gotify and PostgreSQL containers</br>
- Mount all persistent data to ./data/</br>
- Load secure config from .env</br>

## 🛑 Stop the Service
```bash
docker compose down
```

## 🔄 Backup Notes
- Gotify configuration and messages are stored in ./data/gotify/
- PostgreSQL data is stored in ./data/postgres/
- You can archive the whole data/ folder for backups

## 🧠 About n8n

[Gotify](https://gotify.net) is a self-hosted push notification server. It enables sending messages from applications or scripts to mobile and desktop clients.

- 🌐 Website: [https://gotify.net](https://gotify.net)
- 📦 GitHub: [gotify/server](https://github.com/gotify/server)


## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.