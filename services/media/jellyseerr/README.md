<p align="center">
  <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
  &nbsp;&nbsp;&nbsp;
  <strong style="font-size: 1.5em;">Hawk Home — Jellyseerr</strong>
  &nbsp;&nbsp;&nbsp;
  <img src="../../../assets/img/jellyseerr-logo.png" alt="Jellyseerr Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)

`Jellyseerr` is a free and open-source media request management tool for Jellyfin. It provides an easy-to-use interface for users to request movies and TV shows, and integrates seamlessly with Jellyfin to manage your media library. This containerized version is configured for use in the **Hawk Home** homelab stack, with external mounts for persistent data storage.

This setup:
- Loads environment variables from a local `.env` file
- Stores all persistent data in `./data/`

---

## 📁 Directory Structure

```plaintext
jellyseerr/
├── docker-compose.yaml
├── .env                   # Required environment config
├── setup.sh               # Startup script
└── data/
    └── config/            # Jellyseerr config files
```

---

## 🔧 Setup Instructions

Before running the containers, use the provided setup script to create the required folders and apply the correct ownership for Docker volumes.

1. Run the Setup Script (as root)

```bash
chmod +x setup.sh
./setup.sh
```
- Creates `./data/config`
- Applies `chown -R 1000:1000 data/` so containers have proper access

🧑‍💻 This script is intended to be run as root. If you’re not root, prepend with `sudo`.

---

## ⚙️ Environment Configuration

All secrets and hostnames are defined in the `.env` file.

```env
# Timezone
TZ=America/New_York

# Ports
JELLYSEERR_PORT=5055
```

⚠️ Rename to `.env` and do not commit it to source control.

---

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:
- Mount the config directory
- Start Jellyseerr on the configured port
- Preserve data across restarts

---

## 🛑 Stop the Service

```bash
docker compose down
```

---

## 🌍 Access

After the container is up, access the Jellyseerr Web UI at:

```plaintext
http://${Host}:${JELLYSEERR_PORT}
```

---

## 🔄 Backup Notes

- Configuration files are stored in `./data/config`
- Back up the config directory as needed

---

## 🧠 About Jellyseerr

[Jellyseerr](https://github.com/Fallenbagel/jellyseerr) is a media request management tool for Jellyfin. It allows users to request movies and TV shows, and integrates with Jellyfin to manage your media library.

- Docker image: [fallenbagel/jellyseerr](https://hub.docker.com/r/fallenbagel/jellyseerr)
- 📦 GitHub: [Fallenbagel/jellyseerr](https://github.com/Fallenbagel/jellyseerr)

---

## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.
