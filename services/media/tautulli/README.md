<p align="center">
  <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
  &nbsp;&nbsp;&nbsp;
  <strong style="font-size: 1.5em;">Hawk Home — Tautulli</strong>
  &nbsp;&nbsp;&nbsp;
  <img src="../../../assets/img/tautulli-logo.png" alt="Tautulli Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)

`Tautulli` is a monitoring and analytics tool for Plex Media Server. This containerized version is configured for use in the **Hawk Home** homelab stack, with external mounts for persistent data storage.

This setup:
- Loads environment variables from a local `.env` file
- Stores all persistent data in `./data/`

---

## 📁 Directory Structure

```plaintext
tautulli/
├── docker-compose.yaml
├── .env                   # Required environment config
├── setup.sh               # Startup script
└── data/
    └── config/            # Tautulli config files
```

## 🔧 Setup Instructions

Before running the containers, use the provided setup script to create the required folders and apply the correct ownership for Docker volumes.

1. Run the Setup Script (as root)

```bash
chmod +x setup.sh
./setup.sh
```
- Creates ./data/config
- Applies `chown -R 1000:1000 data/` so containers have proper access

🧑‍💻 This script is intended to be run as root. If you’re not root, prepend with `sudo`.

## ⚙️ Environment Configuration

All secrets and hostnames are defined in the `.env` file.

```env
# User and Timezone
PUID=1000
PGID=1000
TZ=America/New_York

# Ports
TAUTULLI_WEBUI_PORT=8181
```

⚠️ Rename to `.env` and do not commit it to source control.

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:
- Mount the config directory
- Start Tautulli on the configured port
- Preserve data across restarts

## 🛑 Stop the Service
```bash
docker compose down
```

## 🌍 Access

After the container is up, access the Tautulli Web UI at:

```plaintext
http://${Host}:${TAUTULLI_WEBUI_PORT}
```

## 🔄 Backup Notes
- Configuration files are stored in ./data/config
- Back up both config and data directories as needed

## 🧠 About Tautulli

[Tautulli](https://tautulli.com/) is a monitoring and analytics tool for Plex Media Server. It provides detailed insights into your Plex usage, including user activity, media playback, and more.

- Docker image: [linuxserver/tautulli](https://hub.docker.com/r/linuxserver/tautulli)
- 📦 GitHub: [Tautulli/Tautulli](https://github.com/Tautulli/Tautulli)

## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.