<p align="center">
  <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
  &nbsp;&nbsp;&nbsp;
  <strong style="font-size: 1.5em;">Hawk Home — Romm</strong>
  &nbsp;&nbsp;&nbsp;
  <img src="../../../assets/img/romm-logo.png" alt="Romm Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)

`Romm` is a beautiful, powerful, self-hosted ROM manager. This containerized version is configured for use in the **Hawk Home** homelab stack, with external mounts for persistent data storage.

This setup:
- Loads environment variables from a local `.env` file
- Stores all persistent data in `./data/`

---

## 📁 Directory Structure

```plaintext
romm/
├── docker-compose.yaml
├── .env                   # Required environment config
├── setup.sh               # Startup script
└── data/
    ├── romm/
    │   ├── resources/     # Romm resources
    │   ├── redis/         # Redis data
    │   ├── assets/        # Romm assets
    │   └── config/        # Romm config files
    └── db/                # MariaDB data
```

---

## 🔧 Setup Instructions

Before running the containers, use the provided setup script to create the required folders and apply the correct ownership for Docker volumes.

1. Run the Setup Script (as root)

```bash
chmod +x setup.sh
./setup.sh
```
- Creates the required directories under `./data/`
- Applies `chown -R 1000:1000 data/` so containers have proper access

🧑‍💻 This script is intended to be run as root. If you’re not root, prepend with `sudo`.

---

## ⚙️ Environment Configuration

All secrets and hostnames are defined in the `.env` file.

```env
# General Settings
TZ=America/New_York
ROMM_PORT=8080
ROMM_AUTH_SECRET=your_secret_key # Generate with `openssl rand -hex 32`

# Database Settings
ROMM_DB_NAME=romm_db
ROMM_DB_USER=romm_user
ROMM_DB_PASS=securepassword
ROMM_DB_PORT=3306
MARIADB_ROOT_PASS=rootpassword

# Metadata Provider Settings
IGDB_CLIENT_ID=your_igdb_client_id
IGDB_CLIENT_SECRET=your_igdb_client_secret
MOBYGAMES_KEY=your_mobygames_key
STEAMGRID_KEY=your_steamgrid_key
SCREENSCRAPER_USER=your_screenscraper_user
SCREENSCRAPER_PASS=your_screenscraper_password
RETROACHIEVEMENTS_KEY=your_retroachievements_key

# OIDC Settings
OIDC_ENABLED=false
OIDC_PROVIDER=
OIDC_CLIENT_ID=
OIDC_CLIENT_SECRET=
OIDC_REDIRECT_URI=
OIDC_SERVER_APPLICATION_URL=

# Paths
ROMM_LIBRARY_PATH=/mnt/storage/roms
```

⚠️ Rename to `.env` and do not commit it to source control.

---

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:
- Mount the required directories
- Start Romm and MariaDB containers
- Preserve data across restarts

---

## 🛑 Stop the Service

```bash
docker compose down
```

---

## 🌍 Access

After the container is up, access the Romm Web UI at:

```plaintext
http://${Host}:${ROMM_PORT}
```

---

## 🔄 Backup Notes

- Romm configuration files are stored in `./data/romm/config`
- MariaDB data is stored in `./data/db`
- Back up both directories as needed

---

## 🧠 About Romm

[Romm](https://github.com/rommapp/romm) is a self-hosted ROM manager that provides a beautiful and powerful interface for managing your game library. It integrates with various metadata providers to enhance your collection.

- Docker image: [rommapp/romm](https://hub.docker.com/r/rommapp/romm)
- 📦 GitHub: [rommapp/romm](https://github.com/rommapp/romm)

---

## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.