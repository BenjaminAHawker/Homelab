<p align="center">
    <strong style="font-size: 1.5em;">Hawk Home — Authentik</strong>
</p>

---

![Status](https://img.shields.io/badge/status-active-success?style=flat-square)
![Docker](https://img.shields.io/badge/docker-ready-blue?style=flat-square)
![License](https://img.shields.io/badge/license-private-lightgrey?style=flat-square)
![Maintainer](https://img.shields.io/badge/maintainer-HawkerFamily-purple?style=flat-square)

`Authentik` is an open-source identity provider. It enables authentication, authorization, and user management for your applications. This containerized version is configured for use in the **Hawk Home** homelab stack, with external mounts for persistent data storage.

This setup:
- Loads environment variables from a local `.env` file
- Stores all persistent data in `./data/`

---

## Directory Structure

```plaintext
authentik/
├── docker-compose.yaml
├── .env                   # Required environment config
└── data/                  # Authentik config files
```

---

## Environment Configuration

All secrets and hostnames are defined in the `.env` file.

```env
# Ports
AUTHENTIK_PORT=9000
```

> **Important** Rename to `.env` and do not commit it to source control.

---

## Start the Service

```bash
docker compose up -d
```
This will:
- Mount the config directory
- Start Authentik on the configured port
- Preserve data across restarts

---

## Stop the Service

```bash
docker compose down
```

---

## Access

After the container is up, access the Authentik Web UI at:

```plaintext
http://${Host}:${AUTHENTIK_PORT}
```

---

## Backup Notes

- Configuration files are stored in `./data/config`
- Back up the config directory as needed

---

## About Authentik

[Authentik](https://goauthentik.io/) is an open-source identity provider designed to handle authentication, authorization, and user management for modern applications.

- Docker image: [goauthentik/server](https://hub.docker.com/r/goauthentik/server)
- GitHub: [goauthentik/authentik](https://github.com/goauthentik/authentik)

---

## Hawk Home

Part of the Hawk Home homelab system — a modular, self-hosted stack for the Hawker family.