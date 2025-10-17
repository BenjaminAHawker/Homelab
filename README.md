<p align="left">
  <img src="assets/img/hhlogo.png" alt="Hawk Home Logo" width="60" style="border-radius: 20px;" />
</p>

<h1 align="left">🏡 Hawk Home -- Personal Homelab</h1>

Welcome to **Hawk Home**, a private homelab environment built for learning, automation, and experimentation. This project hosts self-managed services for the Hawker family, ranging from home automation and media to workflows and monitoring — all containerized and orchestrated using Docker Compose.

---

## 🗂️ Services Overview

### Core Services
- **Nginx Proxy Manager**: Reverse proxy for managing and securing web services with a user-friendly interface.
- **Diun**: Docker image update notifier to monitor and notify when container images are updated.
- **Gotify**: Self-hosted notification server for sending and receiving messages.
- **N8N**: Workflow automation tool for connecting and automating tasks between different services.
- **Portainer**: Web-based Docker management tool for managing containers, images, and networks.

### Home Services
- **Homebox**: Self-hosted file and document management system.
- **Lubelogger**: A tool for tracking and managing vehicle maintenance logs.
- **Maybe Finance**: Personal finance management tool for tracking expenses and budgets.
- **Mealie Recipes**: Recipe manager for organizing and sharing recipes with meal planning features.

### Media Stack
- **Audiobookshelf**: Self-hosted audiobook and podcast server with a web-based interface.
- **Calibre**: E-book management tool for organizing, converting, and reading e-books.
- **Komga**: Self-hosted comics/manga server for organizing and reading digital comics.
- **Tautulli**: Monitor and analyze Plex usage and activity, including user stats and playback history.
- **qBittorrent**: Lightweight torrent client for downloading and managing torrents.
- **Romm**: Self-hosted ROM manager for organizing and managing game libraries.
- **Lidarr**: Music collection manager for automatically downloading and organizing music.
- **Prowlarr**: Indexer manager for managing and integrating indexers with other media tools.
- **Radarr**: Movie collection manager for automatically downloading and organizing movies.
- **Sonarr**: TV show collection manager for automatically downloading and organizing TV series.
- **Whisparr**: Adult content manager for automatically downloading and organizing media.
- **Sabnzbd**: Usenet downloader for managing and downloading NZB files.
- **Overseer**: Media request management tool for Plex, Radarr, and Sonarr.
- **Stashapp**: Self-hosted adult content organizer with tagging and metadata features.

### Automation & Monitoring
- **Speedtest Tracker**: Self-hosted tool for tracking internet speed test results over time.
- **Uptime Kuma**: Self-hosted monitoring tool for tracking the uptime and availability of services.

### Security
- **Flaresolverr**: Proxy server to bypass CAPTCHA challenges for automated tools.
- **Gluetun**: VPN client container for routing traffic through a VPN provider.

### Development & Experimentation
- **ChartDB**: Database diagrams editor that allows you to visualize and design your DB with a single query.

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/BenjaminAHawker/Homelab.git
   cd Homelab
   ```

2. Set up the required `.env` files for each service:
   - Refer to the `README.md` in each service directory for specific instructions.

3. Start the services:
   ```bash
   docker compose up -d
   ```

4. Access the services via their respective ports or domain names.

---


## 🛠️ Maintenance

- **Backups**: Ensure persistent data directories (e.g., `./data/`) are backed up regularly.
- **Updates**: Pull the latest Docker images and restart services:
  ```bash
  docker compose pull
  docker compose up -d
  ```

---

## 👨‍👩‍👧‍👦 About Hawk Home

Hawk Home is a modular, self-hosted stack designed for the Hawker family. It is a constantly evolving project aimed at improving automation, media management, and learning new technologies.
