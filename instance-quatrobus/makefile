build:
	docker build -t app-quatrobus .

run-container: 
	docker run --name app-quatrobus -d -p 85:80 -v /var/www/app-quatrobus:/var/www app-quatrobus

stop-container: 
	docker container stop app-quatrobus && docker container rm app-quatrobus

remove-container: 
	docker container rm app-quatrobus