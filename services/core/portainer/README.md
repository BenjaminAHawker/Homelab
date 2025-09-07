<p align="center">
  <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
  &nbsp;&nbsp;&nbsp;
  <strong style="font-size: 1.5em;">Hawk Home — Portainer Service</strong>
  &nbsp;&nbsp;&nbsp;
  <img src="../../../assets/img/portainer-logo.png" alt="Portainer Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)
![Stack](https://img.shields.io/badge/stack-Core-orange?style=flat-square)

This folder contains the `Portainer` management service and its companion `Portainer Agent`, as part of the **Hawk Home** homelab.  
Portainer provides a web UI for managing Docker containers, while the Portainer Agent allows remote node management in a cluster.

This setup:
- Loads environment variables from a local `.env` file  
- Stores persistent data in `./data/`  
- Runs both Portainer CE and the Portainer Agent  
- Supports multi-node Docker setups with Swarm/overlay networking  

---

## 📁 Directory Structure

```plaintext
portainer/
├── docker-compose.yaml
├── .env                   # Required environment config
└── data/
    ├── portainer/         # Portainer persistent storage
    └── portainer-agent/   # Portainer Agent data volume
```

## 🔧 Setup Instructions

Before running the containers, use the provided setup script to create the required folders and apply the correct ownership for Docker volumes.

1. Run the Setup Script (as root)

```bash
cd services/portainer
chmod +x setup.sh
./setup.sh
```
- Creates ./data/portainer and ./data/portainer-agent</br>
- Applies chown -R 1000:1000 data/ so containers have proper access

🧑‍💻 This script is intended to be run as root. If you’re not root, prepend with sudo.

## ⚙️ Environment Configuration

All secrets and hostnames are defined in the .env file.

```env
PORTAINER_WEB_PORT=9443
PORTAINER_PORT=8000
```
⚠️ Rename to .env and do not commit it to source control.

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:

- Start portainer and portainer-agent</br>
- Mount all persistent data to ./data/</br>
- Load secure config from .env</br>

## 🛑 Stop the Service
```bash
docker compose down
```

## 🔄 Backup Notes
- Portainer UI configuration is stored in ./data/portainer/
- Portainer Agent data is stored in ./data/portainer-agent/
- You can archive the whole data/ folder for backups

## 🧠 About Portainer

[Portainer](https://www.portainer.io/) is a lightweight management UI that allows you to easily manage your Docker containers, images, volumes, and networks.
The Portainer Agent extends Portainer’s functionality to manage remote nodes securely.

- 🌐 Website: [https://www.portainer.io/](https://www.portainer.io/)
- 📦 GitHub: [portainer/portainer](https://github.com/portainer/portainer)


## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.