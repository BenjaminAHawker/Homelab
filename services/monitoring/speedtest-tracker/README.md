<p align="center">
  <img src="../../../assets/img/hhlogo.png" alt="Hawk Home Logo" width="50" style="border-radius: 10px;" />
  &nbsp;&nbsp;&nbsp;
  <strong style="font-size: 1.5em;">Hawk Home — Speedtest Tracker Service</strong>
  &nbsp;&nbsp;&nbsp;
  <img src="../../../assets/img/speedtest-logo.png" alt="Speedtest Logo" width="50" style="border-radius: 12px;" />
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)
![Stack](https://img.shields.io/badge/stack-Monitoring-orange?style=flat-square)

This folder contains the `Speedtest Tracker` service as part of the **Hawk Home**  homelab.
It provides a self-hosted internet speed monitoring dashboard, logging results into a PostgreSQL database.

This setup:
- Loads environment variables from a local `.env` file  
- Stores persistent data in `./data/`  

---

## 📁 Directory Structure

```plaintext
speedtest-tracker/
├── docker-compose.yaml
├── .env                  # Required environment config
└── data/
    ├── speedtest/        # Speedtest Tracker config and data
    ├── keys/             # Encryption keys
    └── postgres/         # PostgreSQL data
```

## 🔧 Setup Instructions

Before running the containers, use the provided setup script to create the required folders and apply the correct ownership for Docker volumes.

1. Run the Setup Script (as root)

```bash
cd services/monitoring/speedtest-tracker
chmod +x setup.sh
./setup.sh
```
- Creates ./data/speedtest , ./data/keys and ./data/postgres</br>
- Applies chown -R 1000:1000 data/ so containers have proper access

🧑‍💻 This script is intended to be run as root. If you’re not root, prepend with sudo.

## ⚙️ Environment Configuration

All secrets and hostnames are defined in the .env file.

```env
SPEEDTEST_PORT=8080
SPEEDTEST_APP_KEY=changeme_random_generated_key
POSTGRES_USER=speedtest
POSTGRES_PASSWORD=changeme_secure_password
POSTGRES_DB=speedtest
```
⚠️ Rename to .env and do not commit it to source control.

## 🚀 Start the Service

```bash
docker compose up -d
```
This will:

- Start Speedtest Tracker</br>
- Start PostgreSQL</br>
- Mount all persistent data to ./data/</br>
- Load secure config from .env</br>

## 🛑 Stop the Service
```bash
docker compose down
```

## 🔄 Backup Notes
- Speedtest Tracker config → ./data/speedtest/
- Encryption keys → ./data/keys/
- PostgreSQL database → ./data/postgres/

You can archive the entire data/ directory for full backups.

## 🧠 About Speedtest Tracker

[Speedtest Tracker](https://docs.speedtest-tracker.dev) is a self-hosted speedtest solution with historical tracking and results visualization.

- 🌐 Website: [https://docs.speedtest-tracker.dev](https://docs.speedtest-tracker.dev)
- 📦 GitHub: [alexjustesen/speedtest-tracker](https://github.com/alexjustesen/speedtest-tracker)


## 👨‍👩‍👧‍👦 Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.