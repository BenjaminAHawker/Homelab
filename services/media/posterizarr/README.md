<p align="center">
  <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
  &nbsp;&nbsp;&nbsp;
  <strong style="font-size: 1.5em;">Hawk Home — Posterizarr</strong>
  &nbsp;&nbsp;&nbsp;
  <img src="../../../assets/img/posterizarr-logo.png" alt="Posterizarr Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)

`Posterizarr` is a self-hosted tool for managing and customizing movie and TV show posters. It integrates with media managers like Plex, Jellyfin and Emby to enhance your media library with high-quality, personalized artwork. This containerized version is configured for use in the **Hawk Home** homelab stack, with external mounts for persistent data storage.

This setup:
- Loads environment variables from a local `.env` file
- Stores all persistent data in `./data/`

---

## 📁 Directory Structure

```plaintext
posterizarr/
├── docker-compose.yaml
├── .env                   # Required environment config
├── setup.sh               # Startup script
└── data/
    └── config/            # Posterizarr config files
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
# User and Timezone
PUID=1000
PGID=1000
TZ=America/New_York

# Ports
POSTERIZARR_PORT=5000

```

⚠️ Rename to `.env` and do not commit it to source control.

---

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:
- Mount the config directory
- Start Posterizarr on the configured port
- Preserve data across restarts

---

## 🛑 Stop the Service

```bash
docker compose down
```

---

## 🌍 Access

After the container is up, access the Posterizarr Web UI at:

```plaintext
http://${Host}:${POSTERIZARR_PORT}
```

---

## 🔄 Backup Notes

- Configuration files are stored in `./data/config`
- Back up the config directory as needed

---

## 🧠 About Posterizarr

[Posterizarr](https://github.com/fscorrupt/Posterizarr) is a self-hosted tool for managing and customizing movie and TV show posters. It integrates with Plex, Emby, or Jellyfin to enhance your media library with high-quality, personalized artwork.

- Docker image: [fscorrupt/posterizarr](https://hub.docker.com/r/fscorrupt/docker-posterizarr)
- 📦 GitHub: [fscorrupt/Posterizarr](https://github.com/fscorrupt/Posterizarr)

---

## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.