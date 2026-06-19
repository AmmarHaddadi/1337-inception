COMPOSE_FILE  = src/docker-compose.yml
# change this
DATA_DIR      = ./data

default: up-watch

up: create_dirs
	docker compose -f $(COMPOSE_FILE) up --build -d

up-watch: create_dirs
	docker compose -f $(COMPOSE_FILE) up --build 

down:
	docker compose -f $(COMPOSE_FILE) down

start:
	docker compose -f $(COMPOSE_FILE) start

stop:
	docker compose -f $(COMPOSE_FILE) stop

clean: down
	docker system prune -a --volumes -f

fclean: clean
	rm -rf $(DATA_DIR)

re: fclean up

create_dirs:
	@mkdir -p $(DATA_DIR)/maria
	@mkdir -p $(DATA_DIR)/wordpress
	@chmod 777 $(DATA_DIR)/*

.PHONY: all up down clean fclean re create_dirs
