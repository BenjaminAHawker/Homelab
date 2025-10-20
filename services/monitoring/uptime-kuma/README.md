<p align="center">
  <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
  &nbsp;&nbsp;&nbsp;
  <strong style="font-size: 1.5em;">Hawk Home — Uptime Kuma</strong>
  &nbsp;&nbsp;&nbsp;
  <img src="../../../assets/img/uptime-kuma-logo.png" alt="Uptime Kuma Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)

`Uptime Kuma` is a self-hosted monitoring tool for tracking the uptime and availability of services. This containerized version is configured for use in the **Hawk Home** homelab stack, with external mounts for persistent data storage.

This setup:
- Loads environment variables from a local `.env` file
- Stores all persistent data in `./data/`

---

## 📁 Directory Structure

```plaintext
uptime-kuma/
├── docker-compose.yaml
├── .env                   # Required environment config
├── setup.sh               # Startup script
└── data/
    └── config/            # Uptime Kuma config files
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
UPTIME_KUMA_PORT=3001

# Paths (adjust as needed)
UPTIME_KUMA_CONFIG_PATH=/mnt/storage/uptime-kuma/config
```

⚠️ Rename to `.env` and do not commit it to source control.

---

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:
- Mount the config directory
- Start Uptime Kuma on the configured port
- Preserve data across restarts

---

## 🛑 Stop the Service

```bash
docker compose down
```

---

## 🌍 Access

After the container is up, access the Uptime Kuma Web UI at:

```plaintext
http://${Host}:${UPTIME_KUMA_PORT}
```

---

## 🔄 Backup Notes

- Configuration files are stored in `./data/config`
- Back up the config directory as needed

---

## 🧠 About Uptime Kuma

[Uptime Kuma](https://github.com/louislam/uptime-kuma) is a self-hosted monitoring tool that provides a beautiful and customizable dashboard for tracking the uptime and availability of your services.

- Docker image: [louislam/uptime-kuma](https://hub.docker.com/r/louislam/uptime-kuma)
- 📦 GitHub: [louislam/uptime-kuma](https://github.com/louislam/uptime-kuma)

---

## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.
