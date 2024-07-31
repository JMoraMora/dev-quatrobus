SERVICE_QUATROBUS = quatrobus
SERVICE_WEB = web


help: ## Show this help message
	@echo 'usage: make [target]'
	@echo
	@echo 'targets:'
	@egrep '^(.+)\:\ ##\ (.+)' ${MAKEFILE_LIST} | column -t -c 2 -s ':#'

up: ## Start the containers
	docker compose up -d

down: ## Stop the containers
	docker compose down

restart: ## Restart the containers
	$(MAKE) down && $(MAKE) up

build: ## Rebuilds all the containers
	docker compose build

ssh-quatrobus: ## ssh's into the instance quatrobus
	docker compose exec -it ${SERVICE_QUATROBUS} bash

ssh-web: ## ssh's into the instance web
	docker compose exec -it ${SERVICE_WEB} bash
