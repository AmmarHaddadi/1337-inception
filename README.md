*This project has been created as part of the 42 curriculum by ahaddadi.*

## Description

Docker project that deploys a WordPress site with Nginx and MariaDB in separate contianers.

### Docker choices

- Virtual Machines vs Docker: 
    - Virtual Machines: Each VM includes its own full copy of an operating system (Guest OS), a virtual copy of the hardware, and the application. This makes them heavy and slower to start.

    - Docker Containers: All containers share the host machine’s OS kernel. They only isolate the application and its dependencies. This makes them incredibly lightweight and fast.

- Secrets vs Environment Variables: Docker Secrets are securely encrypted and only exposed to specific services at runtime, whereas Environment Variables are stored in plain text and visible to anyone or any process with access to the container configuration.

- Docker Network vs Host Network: Docker networks isolate containers in virtual networks with port mapping, while the host network places the container directly on the host's network stack for maximum performance but no isolation..
- Docker Volumes vs Bind Mounts: bind mounts are used for visible host-side persistence in `data/`.

### Project Description

This project uses Docker Compose to run three services in separate containers: NGINX, WordPress with PHP-FPM, and MariaDB. The source files are organized under `srcs/`, and the project uses custom Dockerfiles instead of prebuilt images.

The main design choices are:

- NGINX is the only public entry point and serves HTTPS on port 443 only.
- WordPress runs without NGINX and connects to MariaDB over the internal Docker network.
- MariaDB stores the database data separately from the application container.
- Persistent data is stored on the host under `/home/ahaddadi/data`.

#### Docker vs Virtual Machines

Virtual Machines run a full guest operating system and are heavier. Docker containers share the host kernel, start faster, and use fewer resources.

#### Secrets vs Environment Variables

Secrets are stored as files and are better for confidential values like passwords. Environment variables are easier to pass around, but they are less secure because they can be exposed through inspection or logs.

#### Docker Network vs Host Network

Docker networks isolate containers and let them communicate by service name. The host network removes that isolation and exposes the container more directly to the host network stack.

#### Docker Volumes vs Bind Mounts

Docker volumes are the preferred way to persist data because Docker manages them. Bind mounts map a specific host path into a container and are more directly tied to the host filesystem.

## Instructions

- Run `make up` to build and start the project.
- Run `make down` to stop it.
- Open the site at `https://<DOMAIN_NAME>/` from `src/.env`. (make sure to add to ur DNS)
- Open the admin panel at `https://<DOMAIN_NAME>/wp-admin/`.
- Check status with `docker compose -f src/docker-compose.yml ps`.

## Resources

- https://docs.docker.com/get-started/docker_cheatsheet.pdf
- https://dockerlabs.collabnix.com/docker/cheatsheet/
- https://wiki.alpinelinux.org/wiki/MariaDB
- https://github.com/MansoorMajeed/devops-from-scratch/blob/master/episodes/28-setting-up-wordpress-nginx-php-fpm.md

AI was used to draft and shorten the documentation for this repository + solving a ram limit issue 

See [USER_DOC.md](USER_DOC.md) and [DEV_DOC.md](DEV_DOC.md) for the minimal user and developer notes.
