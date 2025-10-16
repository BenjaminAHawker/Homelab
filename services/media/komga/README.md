<p align="center">
    <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
    &nbsp;&nbsp;&nbsp;
    <strong style="font-size: 1.5em;">📚 Hawk Home — Komga Service</strong>
    &nbsp;&nbsp;&nbsp;
    <img src="../../../assets/img/komga-logo.png" alt="Komga Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)

This folder contains the `Komga` comic and manga management service as part of the **Hawk Home** homelab. It uses Docker Compose to run the Komga server for managing and reading your comic library.

This setup:
- Loads environment variables from a local `.env` file
- Stores all persistent data in `./data/`
- Provides a web interface for library management and reading

---

## 📁 Directory Structure

```plaintext
komga/
├── docker-compose.yaml
├── .env                   # Required environment config
└── data/
        ├── config/            # Komga configuration data
        └── library/           # Komga comic and manga library location
```

## 🔧 Setup Instructions

Before running the container, use the provided setup script to create the required folders and apply the correct ownership for Docker volumes.

1. Run the Setup Script (as root)

```bash
chmod +x setup.sh
./setup.sh
```
- Creates ./data/config and ./data/library  
- Applies `chown -R 1000:1000 data/` so the container has proper access

🧑‍💻 This script is intended to be run as root. If you’re not root, prepend with `sudo`.

## ⚙️ Environment Configuration

All secrets and hostnames are defined in the `.env` file.

```env
KOMGA_USER=admin
KOMGA_PASSWORD=changeme
KOMGA_DATA_PATH=/path/to/comics
KOMGA_SERVER_PORT=8080
PUID=1000
PGID=1000
TZ=UTC
```

⚠️ Rename to `.env` and do not commit it to source control.

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:

- Start the Komga server  
- Mount all persistent data to `./data/`  
- Load secure config from `.env`  

## 🛑 Stop the Service
```bash
docker compose down
```

## 🔄 Backup Notes
- All Komga settings and metadata are stored in `./data/config/`
- The comic and manga library is located in `./data/library/`
- You can archive the whole `data/` folder for backups

## 🧠 About Komga

[Komga](https://komga.org/) is a free and open-source comics/manga server that lets you manage and read your library via a web interface.

- 🌐 Website: [https://komga.org/](https://komga.org/)
- 📦 GitHub: [gotson/komga](https://github.com/gotson/komga)

## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.
