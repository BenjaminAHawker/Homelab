<p align="center">
  <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
  &nbsp;&nbsp;&nbsp;
  <strong style="font-size: 1.5em;">Hawk Home — Mealie Recipes Service</strong>
  &nbsp;&nbsp;&nbsp;
  <img src="../../../assets/img/mealie-logo.png" alt="mealie Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)
![Stack](https://img.shields.io/badge/stack-Home-orange?style=flat-square)

This folder contains the **Mealie Recipe Manager** service as part of the **Hawk Home** homelab.  
Mealie is a self-hosted recipe manager with a web interface, mobile-friendly design, and optional authentication integrations.

This setup:
- Loads environment variables from a local `.env` file  
- Stores all persistent data in `./data/`  
- Uses PostgreSQL for persistence  
- Supports optional OIDC authentication (e.g., Authentik)  
---

## 📁 Directory Structure

```plaintext
mealie/
├── docker-compose.yaml
├── .env                   # Required environment config
└── data/
    ├── mealie/            # Persistent app data
    └── postgres/          # Database data
```

## 🔧 Setup Instructions

Before running the containers, use the provided setup script to create the required folders and apply the correct ownership for Docker volumes.

1. Run the Setup Script (as root)

```bash
cd services/mealie-recipes
chmod +x setup.sh
./setup.sh
```
- Creates ./data/mealie and ./data/postgres</br>
- Applies chown -R 1000:1000 data/ so containers have proper access

🧑‍💻 This script is intended to be run as root. If you’re not root, prepend with sudo.

## ⚙️ Environment Configuration

All secrets and hostnames are defined in the .env file.

```env
# Mealie Settings
MEALIE_PORT=
MEALIE_BASE_URL=

# PostgreSQL Settings
MEALIE_DB_USER=
MEALIE_DB_PASSWORD=
MEALIE_DB_NAME=

# Optional OIDC Settings
MEALIE_OIDC_AUTH_ENABLED=
MEALIE_OIDC_PROVIDER_NAME=
MEALIE_OIDC_CLIENT_ID=
MEALIE_OIDC_CLIENT_SECRET=
MEALIE_OIDC_CONFIGURATION_URL=
MEALIE_OIDC_REMEMBER_ME=
```
⚠️ Rename to .env and do not commit it to source control.

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:

- Start mealie and postgres</br>
- Mount all persistent data to ./data/</br>
- Load secure config from .env</br>

Access the web UI at http://{host-ip}:${MEALIE_PORT}

## 🛑 Stop the Service
```bash
docker compose down
```

## 🔄 Backup Notes
- Mealie data (recipes, images, config) is stored in ./data/mealie/
- PostgreSQL data is stored in ./data/postgres/
- Backup both directories for a complete restore

## 🧠 About Mealie

[Mealie Recipes](https://docs.mealie.io/) is a self-hosted recipe manager.
It offers recipe collection, meal planning, grocery lists, and optional authentication integrations.

- 🌐 Website: [https://docs.mealie.io/](https://docs.mealie.io/)
- 📦 GitHub: [mealie-recipes/mealie](https://github.com/mealie-recipes/mealie)


## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.