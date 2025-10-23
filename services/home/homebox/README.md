<p align="center">
  <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
  &nbsp;&nbsp;&nbsp;
  <strong style="font-size: 1.5em;">Hawk Home — Homebox</strong>
  &nbsp;&nbsp;&nbsp;
  <img src="../../../assets/img/homebox-logo.png" alt="Homebox Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)

`Homebox` is a self-hosted inventory and organization system. It allows you to organize, search, and manage your inventory with ease. This containerized version is configured for use in the **Hawk Home** homelab stack, with external mounts for persistent data storage.

This setup:
- Loads environment variables from a local `.env` file
- Stores all persistent data in `./data/`

---

## 📁 Directory Structure

```plaintext
homebox/
├── docker-compose.yaml
├── .env                   # Required environment config
├── setup.sh               # Startup script
└── data/
    └── config/            # Homebox config files
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
# Ports
HOMEBOX_PORT=8085

```

⚠️ Rename to `.env` and do not commit it to source control.

---

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:
- Mount the config directory
- Start Homebox on the configured port
- Preserve data across restarts

---

## 🛑 Stop the Service

```bash
docker compose down
```

---

## 🌍 Access

After the container is up, access the Homebox Web UI at:

```plaintext
http://${Host}:${HOMEBOX_PORT}
```

---

## 🔄 Backup Notes

- Configuration files are stored in `./data/config`
- Back up the config directory as needed

---

## 🧠 About Homebox

[Homebox](https://github.com/sysadminsmedia/homebox) is a self-hosted inventory and organization system for managing household items. It provides a powerful interface for organizing, searching, and managing your home inventory.

- Docker image: [sysadminsmedia/homebox](https://hub.docker.com/r/sysadminsmedia/homebox)
- 📦 GitHub: [sysadminsmedia/homebox](https://github.com/sysadminsmedia/homebox)

---

## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.