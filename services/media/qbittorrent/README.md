<p align="center">
  <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
  &nbsp;&nbsp;&nbsp;
  <strong style="font-size: 1.5em;">Hawk Home — qBittorrent</strong>
  &nbsp;&nbsp;&nbsp;
  <img src="../../../assets/img/qbittorrent-logo.png" alt="qBittorrent Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)

`qBittorrent` is a powerful and feature-rich BitTorrent client. This containerized version is configured for use in the **Hawk Home** homelab stack, with external mounts for media handling and download paths. It is also configured to route traffic through **Gluetun**, a VPN client container, to ensure secure and private downloads.

This setup:
- Loads environment variables from a local `.env` file
- Routes all qBittorrent traffic through Gluetun for VPN protection
- Stores all persistent data in `./data/`

---

## 📁 Directory Structure

```plaintext
qbittorrent/
├── docker-compose.yaml
├── .env                   # Required environment config
├── setup.sh               # Startup script
└── data/
    └── config/            # qBittorrent config files
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
# qBittorrent - Variables
QBITTORRENT_WEBUI_PORT=
QBITTORRENT_LISTENING_PORT=
QBITTORRENT_PORT=
QBITTORRENT_TORRENTS_PATH=
QBITTORRENT_MEDIA_PATH=
PUID=
PGID=
TZ=

# Gluetun - Variables
GLUETUN_HTTP_PORT= 
GLUETUN_WIREGUARD_PORT=
GLUETUN_VPN_SERVICE_PROVIDER=
GLUETUN_VPN_TYPE=
GLUETUN_WIREGUARD_PRIVATE_KEY=
GLUETUN_WIREGUARD_ADDRESSES=
GLUETUN_SERVER_COUNTRIES=
```

⚠️ Rename to `.env` and do not commit it to source control.

---

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:
- Mount the config, torrent, and media directories
- Start qBittorrent on the configured ports
- Route all qBittorrent traffic through Gluetun for VPN protection
- Preserve data across restarts

---

## 🛑 Stop the Service

```bash
docker compose down
```

---

## 🌍 Access

After the container is up, access the qBittorrent Web UI at:

```plaintext
http://${Host}:${QBITTORRENT_WEBUI_PORT}
```

---

## 🔄 Backup Notes

- Configuration files are stored in `./data/config`
- Downloaded content and media are stored at external paths (`/mnt/storage`, etc.)
- Back up both config and data directories as needed

---

## 🔐 About Gluetun

[Gluetun](https://github.com/qdm12/gluetun) is a lightweight VPN client container that supports multiple VPN providers. It ensures that all qBittorrent traffic is routed securely through a VPN connection.

- Docker image: [qmcgaw/gluetun](https://hub.docker.com/r/qmcgaw/gluetun)
- 📦 GitHub: [qdm12/gluetun](https://github.com/qdm12/gluetun)

---

## 🧠 About qBittorrent

[qBittorrent](https://www.qbittorrent.org/) is a free and reliable BitTorrent client with an intuitive user interface and built-in search engine.

- Docker image: [linuxserver/qbittorrent](https://hub.docker.com/r/linuxserver/qbittorrent)
- 📦 GitHub: [qbittorrent/qBittorrent](https://github.com/qbittorrent/qBittorrent)

---

## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.