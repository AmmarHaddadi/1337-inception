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
