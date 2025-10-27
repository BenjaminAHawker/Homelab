# Basic Docker Commands

| Command                          | Description                              |
|----------------------------------|------------------------------------------|
| `docker ps -a`                   | View all containers (running and stopped). |
| `docker rm <container_id>`       | Remove a specific container.             |
| `docker rm $(docker ps -aq)`     | Remove all containers.                   |
| `docker images`                  | List all Docker images.                  |
| `docker rmi <image_id>`          | Remove a specific Docker image.          |
| `docker rmi $(docker images -q)` | Remove all Docker images.                |
| `docker start <container_id>`    | Start a stopped container.               |
| `docker stop <container_id>`     | Stop a running container.                |
| `docker logs <container_id>`     | View logs of a container.                |
| `docker exec -it <container_id> bash` | Access a running container's shell.    |
| `docker container prune`         | Remove all stopped containers.           |