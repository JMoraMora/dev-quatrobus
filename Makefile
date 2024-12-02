SERVICE_QUATROBUS = quatrobus
SERVICE_WEB = web
SERVICE_MARIADB = mariadb
SERVICE_REDIS = redis
SERVICE_MONITOR = monitor

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

ssh-redis: ## ssh's into the redis from service web
	docker compose exec -it ${SERVICE_REDIS} redis-cli -a globalbts

ssh-mariadb: ## ssh's into the instance web
	docker compose exec -it ${SERVICE_MARIADB} mariadb -u root -p

quaweb-prepare: ## prepare quaweb, install node_modules
	docker compose exec -it ${SERVICE_WEB} npm install

quaweb-run: ## run quaweb in localhost:8080
	docker compose exec -it ${SERVICE_WEB} npm run serve

quaweb-build: ## build quaweb for deploy
	docker compose exec -it ${SERVICE_WEB} npm run build
	
monitor-prepare: ## prepare monitor, install node_modules and dependencies with composer
	$(MAKE) monitor-prepare-npm && $(MAKE) monitor-prepare-composer

monitor-prepare-npm: ## prepare monitor, install node_modules and dependencies with composer
	docker compose exec -it ${SERVICE_MONITOR} npm install
	
monitor-prepare-composer: ## prepare monitor, install node_modules and dependencies with composer
	docker compose exec -it ${SERVICE_MONITOR} composer install
	
monitor-run-vite: ## monitor run vite
	docker compose exec -it ${SERVICE_MONITOR} npm run dev
	
monitor-run-serve: ## monitor run artisan serve
	docker compose exec -it ${SERVICE_MONITOR} php artisan serve --host=0.0.0.0 --port=8000