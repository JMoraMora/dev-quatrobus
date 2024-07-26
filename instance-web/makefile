build:
	docker build -t instance-web .

run-container: 
	docker run --name instance-web -d -p 86:80 -p 8080:8080 -v /var/www/mcets/instance-web:/var/www instance-web

stop-container: 
	docker container stop instance-web && docker container rm instance-web

remove-container: 
	docker container rm instance-web

ssh-be: ## ssh's into the be container
	docker exec -it instance-web bash