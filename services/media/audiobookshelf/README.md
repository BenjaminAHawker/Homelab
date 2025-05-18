# Audiobookshelf Docker Compose Configuration

This document provides an overview of the Docker Compose configuration for deploying **Audiobookshelf**, a self-hosted audiobook and podcast manager.

<details>
    <summary>Click to view docker-compose.yaml configuration</summary>

```yaml
services:
#---------------------------------------------------------------------#
#     Audiobookshelf - Audiobook Manager.                             #
#---------------------------------------------------------------------#
  audiobookshelf:
    image: ghcr.io/advplyr/audiobookshelf:latest
    container_name: audiobookshelf
    restart: always
    ports:
      - ${AUDIOBOOKSHELF_PORT}:80
    env_file:
      - .env
    environment:
      - TZ=${TZ}
    volumes:
      - ${AUDIOBOOKSHELF_AUDIOBOOK_PATH}:/audiobooks
      - ${AUDIOBOOKSHELF_PODCAST_PATH}:/podcasts
      - audiobookshelf_metadata:/metadata
      - audiobookshelf_config:/config

volumes:
  audiobookshelf_metadata:
    driver: local
  audiobookshelf_config:
    driver: local
```

```.env
AUDIOBOOKSHELF_AUDIOBOOK_PATH=
AUDIOBOOKSHELF_PODCAST_PATH=
AUDIOBOOKSHELF_PORT=
```

</details>

---

## Service Overview

### `audiobookshelf`
The main service for running the Audiobookshelf application.

- **Image**: `ghcr.io/advplyr/audiobookshelf:latest`
- **Container Name**: `audiobookshelf`
- **Restart Policy**: `always`
- **Ports**:
  - `${AUDIOBOOKSHELF_PORT}:80` - Exposes the Audiobookshelf web interface on the specified host port.
- **Environment Variables**:
  - `TZ`: Timezone for the container (e.g., `America/New_York`).
- **Volumes**:
  - `${AUDIOBOOKSHELF_AUDIOBOOK_PATH}:/audiobooks` - Stores audiobook files.
  - `${AUDIOBOOKSHELF_PODCAST_PATH}:/podcasts` - Stores podcast files.
  - `audiobookshelf_metadata:/metadata` - Stores metadata for audiobooks and podcasts.
  - `audiobookshelf_config:/config` - Stores configuration files.

---

## Volumes


### `audiobookshelf_config`
- **Driver**: `local`

This volume ensures that configuration files are persisted across container restarts.

### `audiobookshelf_metadata`
- **Driver**: `local`

This volume ensures that metadata files are persisted across container restarts.

---

## Usage

## Prerequisites

Ensure the `.env` file is properly configured with the required environment variables:

| Variable Name                | Description                                      | Example Value         |
|------------------------------|--------------------------------------------------|-----------------------|
| `AUDIOBOOKSHELF_PORT`        | Port on the host for Audiobookshelf.             | `13378`              |
| `TZ`                         | Timezone for the container.                      | `America/New_York`   |
| `AUDIOBOOKSHELF_AUDIOBOOK_PATH` | Path to the directory containing audiobooks.    | `/path/to/audiobooks` |
| `AUDIOBOOKSHELF_PODCAST_PATH`  | Path to the directory containing podcasts.       | `/path/to/podcasts`   |

---

Ensure all variables are properly set in the `.env` file before starting the services.

1. Ensure the `.env` file is properly configured with the required environment variables
2. Start the services using Docker Compose:
     ```bash
     docker-compose up -d
     ```
3. Access the Audiobookshelf web interface in your browser:
    - URL: http://<host>:${AUDIOBOOKSHELF_PORT}


For more information, refer to the [Audiobookshelf documentation](https://github.com/advplyr/audiobookshelf).