<p align="center">
  <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
  &nbsp;&nbsp;&nbsp;
  <strong style="font-size: 1.5em;">📚 Hawk Home — Audiobookshelf Service</strong>
  &nbsp;&nbsp;&nbsp;
  <img src="../../../assets/img/audiobookshelf.png" alt="audiobookshelf Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)

Audiobookshelf is a self-hosted audiobook and podcast manager. This containerized version is configured for the **Hawk Home** homelab with local metadata/config storage and mounted media paths.

This setup:
- Loads environment variables from a local `.env` file
- Stores all persistent data in `./data/`
- Includes both desktop GUI access and a web interface

---

## 📁 Directory Structure

```plaintext
calibre/
├── docker-compose.yaml
├── .env                   # Required environment config
├── setup.sh               
└── data/
    ├── config/            # App settings
    └── metadata/          # Listening progress, bookmarks, users
```

## 🔧 Setup Instructions

Before running the containers, use the provided setup script to create the required folders and apply the correct ownership for Docker volumes.

1. Run the Setup Script (as root)

```bash
chmod +x setup.sh
./setup.sh
```
- Creates ./data/config and ./data/metadata  
- Applies `chown -R 1000:1000 data/` so containers have proper access

🧑‍💻 This script is intended to be run as root. If you’re not root, prepend with `sudo`.

## ⚙️ Environment Configuration

All secrets and hostnames are defined in the `.env` file.

```env
TZ=America/New_York
AUDIOBOOKSHELF_AUDIOBOOK_PATH=/mnt/audiobook/path
AUDIOBOOKSHELF_PODCAST_PATH=/mnt/podcast/path
DATA_PATH=/mnt/data/path
AUDIOBOOKSHELF_PORT=13378
```

⚠️ Rename to `.env` and do not commit it to source control.

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:

- Start Audiobookshelf service on port defined in `.env`
- Mount all persistent data to `./data/`  
- Load secure config from `.env`  

## 🛑 Stop the Service
```bash
docker compose down
```

## 🌍 Access

After the container is up, access audiobookshelf at:

```plaintext
http://${Host}:${AUDIOBOOKSHELF_PORT}
```
- Set up the first admin user on initial login
- Add libraries pointing to /audiobooks and /podcasts

## 🔄 Backup Notes
- `./data/config`: App config and settings
- `./data/metadata`: Users, listening progress, bookmarks
- Media libraries are stored externally and not affected by container restarts

## 🧠 About Calibre

[Audiobookshelf](https://www.audiobookshelf.org/) is an open-source self-hosted audiobook and podcast server with a clean web UI and mobile app support.

- 📦 GitHub: [advplyr/audiobookshelf](https://github.com/advplyr/audiobookshelf)

## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.