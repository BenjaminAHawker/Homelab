<p align="center">
  <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
  &nbsp;&nbsp;&nbsp;
  <strong style="font-size: 1.5em;">📚 Hawk Home — Calibre Service</strong>
  &nbsp;&nbsp;&nbsp;
  <img src="../../../assets/img/calibre-logo.png" alt="calibre Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)

This folder contains the `Calibre` eBook management service as part of the **Hawk Home** homelab. It uses Docker Compose to run both the Calibre GUI and Calibre Web UI for browser-based library management.

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
└── data/
    ├── config/            # Calibre and Calibre Web config data
    └── library/           # Calibre eBook library location
```

## 🔧 Setup Instructions

Before running the containers, use the provided setup script to create the required folders and apply the correct ownership for Docker volumes.

1. Run the Setup Script (as root)

```bash
chmod +x setup.sh
./setup.sh
```
- Creates ./data/config and ./data/library  
- Applies `chown -R 1000:1000 data/` so containers have proper access

🧑‍💻 This script is intended to be run as root. If you’re not root, prepend with `sudo`.

## ⚙️ Environment Configuration

All secrets and hostnames are defined in the `.env` file.

```env
CALIBRE_USER=admin
CALIBRE_PASSWORD=changeme
CALIBRE_DATA_PATH=/path/to/ebooks
CALIBRE_DESKTOP_UI_PORT=8080
CALIBRE_DESKTOP_HTTPS_PORT=8181
CALIBRE_WEBSERVER_PORT=8081
CALIBRE_WEB_PORT=8083
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

- Start both Calibre and Calibre Web  
- Mount all persistent data to `./data/`  
- Load secure config from `.env`  

## 🛑 Stop the Service
```bash
docker compose down
```

## 🔄 Backup Notes
- All Calibre settings and metadata are stored in `./data/config/`
- The eBook library is located in `./data/library/`
- You can archive the whole `data/` folder for backups

## 🧠 About Calibre

[Calibre](https://calibre-ebook.com/) is a powerful eBook manager that lets you view, convert, edit, and catalog eBooks across all major formats.

- 🌐 Website: [https://calibre-ebook.com/](https://calibre-ebook.com/)
- 📦 GitHub: [kovidgoyal/calibre](https://github.com/kovidgoyal/calibre)

[Calibre Web](https://github.com/janeczku/calibre-web) is a web app for browsing, reading, and downloading eBooks stored in a Calibre database.

## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.