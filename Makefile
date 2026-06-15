COMPOSE_FILE  = src/docker-compose.yml
# change this
DATA_DIR      = /workspaces/codespaces-blank/data

default: up

up: create_dirs
	docker compose -f $(COMPOSE_FILE) up --build -d

down:
	docker compose -f $(COMPOSE_FILE) down

start:
	docker compose -f $(COMPOSE_FILE) start

stop:
	docker compose -f $(COMPOSE_FILE) stop

clean: down
	docker system prune -a --volumes -f

fclean: clean
	sudo rm -rf $(DATA_DIR)/maria
	sudo rm -rf $(DATA_DIR)/wp

re: fclean up

create_dirs:
	@mkdir -p $(DATA_DIR)/maria
	@mkdir -p $(DATA_DIR)/wp

.PHONY: all up down clean fclean re create_dirs