# 🏡 Hawk Home — n8n Service

This folder contains the `n8n` workflow automation service as part of the **Hawk Home** homelab. It uses Docker Compose and a PostgreSQL backend for persistence.

This setup:
- Loads environment variables from a local `.env` file
- Stores all persistent data in `./data/`
- Separates n8n and PostgreSQL cleanly
- Is compatible with reverse proxies like Nginx Proxy Manager

---

## 📁 Directory Structure

```plaintext
n8n/
├── docker-compose.yaml
├── .env                   # Required environment config
└── data/
    ├── n8n/               # n8n persistent storage
    └── postgres/          # PostgreSQL data volume
```