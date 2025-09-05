<p align="center">
  <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
  &nbsp;&nbsp;&nbsp;
  <strong style="font-size: 1.5em;">Hawk Home — Nginx Proxy Manager Service</strong>
  &nbsp;&nbsp;&nbsp;
  <img src="../../../assets/img/nginx-proxy-logo.png" alt="Nginx Proxy Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)
![Stack](https://img.shields.io/badge/stack-Core-orange?style=flat-square)

This folder contains the **Nginx Proxy Manager (NPM) service** as part of the **Hawk Home** homelab. It provides an easy-to-use web interface for managing reverse proxies, SSL certificates, and routing to internal services.

This setup:
- Loads environment variables from a local `.env` file
- Stores all persistent data in `./data/`
- Separates NPM and PostgreSQL cleanly

---

## 📁 Directory Structure

```plaintext
nginx-proxy-manager/
├── docker-compose.yaml
├── .env                   # Required environment config
├── setup.sh               # setup script to create folders and permissions
└── data/
    ├── letsencrypt/       # SSL certificates
    ├── nginx/             # nginx-proxy persistent storage
    └── postgres/          # PostgreSQL data volume
```

## 🔧 Setup Instructions

Before running the containers, use the provided setup script to create the required folders and apply the correct ownership for Docker volumes.

1. Run the Setup Script (as root)

```bash
cd services/nginx-proxy-manager
chmod +x setup.sh
./setup.sh
```
- Creates ./data/letsencrypt, ./data/nginx and ./data/postgres</br>
- Applies chown -R 1000:1000 data/ so containers have proper access

🧑‍💻 This script is intended to be run as root. If you’re not root, prepend with sudo.

## ⚙️ Environment Configuration

All secrets and hostnames are defined in the .env file.

```env
NGINX_PUBLIC_PORT=
NGINX_PUBLIC_HTTPS_PORT=
NGINX_WEB_PORT=

DB_POSTGRES_USER=
DB_POSTGRES_PASSWORD=
DB_POSTGRES_NAME=
```
⚠️ Rename to .env and do not commit it to source control.

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:

- Start NPM and PostgreSQL containers</br>
- Mount all persistent data to ./data/</br>
- Load secure config from .env</br>

## 🛑 Stop the Service
```bash
docker compose down
```

## 🔄 Backup Notes
- Nginx Proxy Manager data is stored in ./data/nginx/
- PostgreSQL data is stored in ./data/postgres/
- Letsencrypt SSL certificates are store in ./data/letsencrypt
- You can archive the whole data/ folder for backups

## 🌐 Access
- Web UI: http://${your-server-ip}:${NGINX_WEB_PORT}
- Default credentials (first run):
    - Email: admin@example.com
    - Password: changeme

## 🧠 About Nginx Proxy Manager

[Nginx Proxy Manager](https://nginxproxymanager.com) provides a simple, powerful web interface for managing reverse proxies with SSL.

- 🌐 Website: [nginxproxymanager.com](https://nginxproxymanager.com)
- 📦 GitHub: [jc21/nginx-proxy-manager](https://github.com/NginxProxyManager/nginx-proxy-manager)


## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.