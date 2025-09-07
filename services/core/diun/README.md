<p align="center">
    <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
    &nbsp;&nbsp;&nbsp;
    <strong style="font-size: 1.5em;">Hawk Home — Diun Service</strong>
    &nbsp;&nbsp;&nbsp;
    <img src="../../../assets/img/diun-logo.png" alt="Diun Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)
![Stack](https://img.shields.io/badge/stack-Core-orange?style=flat-square)

This folder contains the **Diun (Docker Image Update Notifier)** service as part of the **Hawk Home** homelab. It uses Docker Compose and a SQLite backend for persistence.

This setup:
- Loads environment variables from a local `.env` file
- Stores all persistent data in `./data/`
- Sends notifications via Gotify or other supported platforms
- Is compatible with reverse proxies like Nginx Proxy Manager

---

## 📁 Directory Structure

```plaintext
diun/
├── docker-compose.yaml
├── .env                   # Required environment config
├── config/
|   ├── diun.yaml          # Config file
|   └── images.yaml        # Images to watch outside of labels
└── data/
    └── diun.db            # SQLite database for Diun
```

## 🔧 Setup Instructions

Before running the containers, use the provided setup script to create the required folders and apply the correct ownership for Docker volumes.

1. Run the Setup Script (as root)

```bash
cd services/diun
chmod +x setup.sh
./setup.sh
```
- Creates ./data/</br>
- Applies chown -R 1000:1000 data/ so containers have proper access

🧑‍💻 This script is intended to be run as root. If you’re not root, prepend with sudo.

## ⚙️ Environment Configuration

All secrets and hostnames are defined in the .env file.

```env
DIUN_WATCH_WORKERS=
DIUN_WATCH_SCHEDULE=
DIUN_NOTIF_GOTIFY_ENDPOINT=
DIUN_NOTIF_GOTIFY_TOKEN=
TZ=
```
⚠️ Rename to .env and do not commit it to source control.

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:

- Start the Diun container</br>
- Mount all persistent data to ./data/</br>
- Load secure config from .env</br>

## 🛑 Stop the Service
```bash
docker compose down
```

## 🔄 Backup Notes
- Diun configuration and database are stored in ./data/diun.db
- You can archive the whole data/ folder for backups

## How To Use
- Add proper labels to docker compose images Ex.
``` plaintext
  nginx:
    image: nginx:latest
    restart: always
    labels:
      - "diun.enable=true"        # watch this container
      - "diun.watch_repo=true"    # track all tags in repo
      - "diun.max_tags=3"         # only notify about the 3 latest tags
```

## 🧠 About Diun

[Diun](https://crazymax.dev/diun/) is a Docker image update notifier. It monitors your Docker images and sends notifications when updates are available.

- 🌐 Website: [https://crazymax.dev/diun/](https://crazymax.dev/diun/)
- 📦 GitHub: [crazy-max/diun](https://github.com/crazy-max/diun)

## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.