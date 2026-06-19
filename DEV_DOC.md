# Developer Documentation

all containers run on alpine linux 3.23.4
dockerfiles can be found in `srcs/` with a directory for each service. The `srcs/docker-compose.yml` file defines the services and their configurations.

read the [USER_DOC.md](USER_DOC.md) first.

## Setup

- Prerequisites: Docker, Docker Compose, and Make.
- Configuration: `srcs/docker-compose.yml`, `srcs/.env`, and files in `secrets/`.

## Build and Launch

- Build and start: `make up`
- Foreground run: `make up-watch`
- Raw Compose: `docker compose -f srcs/docker-compose.yml up --build`

## Manage Containers

- Start: `make start`
- Stop: `make stop`
- Down: `make down`
- Clean: `make clean`
- Full reset: `make fclean`
- Recreate: `make re`

## Persistent Data

- MariaDB data: `/home/ahaddadi/data/maria/`
- WordPress data: `/home/ahaddadi/data/wordpress/`
- The Makefile creates these host directories and Compose binds them into the containers.

to change volume destinations, edit the `srcs/docker-compose.yml` file and update the `volumes:` section for each service + change DATA_DIR in the Makefile.
