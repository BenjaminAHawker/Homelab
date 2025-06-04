# GetHomepage Docker Compose Configuration

This document provides an overview of the Docker Compose configuration for deploying GetHomepage and its related services.

```yaml 
services:
#---------------------------------------------------------------------#
#     Homepage - A modern,fully static application dashboard.         #
#---------------------------------------------------------------------#
  homepage:
    image: ghcr.io/gethomepage/homepage:latest
    container_name: homepage
    restart: always
    ports:
      - ${HOMEPAGE_PORT}:3000 # host:docker
    env_file:
      - .env
    environment:
      - HOMEPAGE_ALLOWED_HOSTS=${HOMEPAGE_HOST}:${HOMEPAGE_PORT}
      - PUID=${PUID}
      - PGID=${PGID}
      - TZ=${TZ}
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./config:/app/config
      - ./images:/app/public/images
```

```.env
PUID=1000
PGID=1000
TZ=Etc/UTC
HOMEPAGE_HOST=example.com,10.0.0.234
HOMEPAGE_PORT=8008
```

## Services

### `getHomepage`
The main service for running the GetHomepage application.

- **Image**: `ghcr.io/gethomepage/homepage:latest`
- **Restart Policy**: Always
- **Ports**: Maps the host port `${HOMEPAGE_PORT}` to container port `3000`.
- **Environment Variables**:
    - `HOMEPAGE_ALLOWED_HOSTS`: A comma-separated list of allowed hosts for the application.
    - `PUID`: User ID for file permissions.
    - `PGID`: Group ID for file permissions.
    - `TZ`: Timezone for the container (e.g., `America/New_York`).
- **Volumes**:
    - `/var/run/docker.sock:/var/run/docker.sock`: Allows the container to communicate with the Docker daemon on the host.
    - `./config:/app/config`: Maps the directory `./config` to the container path `/app/config` for persisting application data.
    - `./images:/app/public/images`: Maps the directory `./images` to the container path `/app/public/images` for persisting images used by the application.

## Usage

### `.env` File Configuration

The `.env` file is used to configure environment variables for the Docker Compose setup. Below is a table describing the required variables:

| Variable Name        | Description                                      | Example Value         |
|----------------------|--------------------------------------------------|-----------------------|
| `HOMEPAGE_PORT`      | Port on the host to access the GetHomepage app.  | `8080`                |
| `HOMEPAGE_ALLOWED_HOSTS` | Comma-separated list of allowed hosts for the app. | `localhost,example.com` |
| `PUID`               | User ID for file permissions.                   | `1000`                |
| `PGID`               | Group ID for file permissions.                  | `1000`                |
| `TZ`                 | Timezone for the container.                     | `America/New_York`    |

Ensure all variables are properly set in the `.env` file before starting the services.

1. Ensure the `.env` file is properly configured with the required environment variables
2. Start the services using Docker Compose:
     ```bash
     docker-compose up -d
     ```
3. Access the GetHomepage application at `http://<host>:${HOMEPAGE_PORT}`.

For more information, refer to the [GetHomepage documentation](https://gethomepage.dev/).

