SERVICE_QUATROBUS = quatrobus
SERVICE_WEB = web
SERVICE_MARIADB = mariadb

help: ## Show this help message
	@echo 'usage: make [target]'
	@echo
	@echo 'targets:'
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

up: ## Start the containers
	docker compose up -d

down: ## Stop the containers
	docker compose down

ps: ## list containers into compose
	docker compose ps

ps-all: ## list all containers into compose
	docker compose ps -a

restart: ## Restart the containers
	$(MAKE) down && $(MAKE) up

build: ## Rebuilds all the containers
	docker compose build

ssh-quatrobus: ## ssh's into the instance quatrobus
	docker compose exec -it ${SERVICE_QUATROBUS} bash

ssh-web: ## ssh's into the instance web
	docker compose exec -it ${SERVICE_WEB} bash

ssh-mariadb: ## ssh's into the instance web
	docker compose exec -it ${SERVICE_MARIADB} mariadb -u root -p

quaweb-prepare: ## run quaweb in localhost:8080
	docker compose exec -it ${SERVICE_WEB} npm install

quaweb-run: ## run quaweb in localhost:8080
	docker compose exec -it ${SERVICE_WEB} npm run serve

quaweb-build: ## build quaweb for deploy
	docker compose exec -it ${SERVICE_WEB} npm run build