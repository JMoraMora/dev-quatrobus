build:
	docker build -t instance-quatrobus .

run-container: 
	docker run --name instance-quatrobus -d -p 85:80 -v /var/www/mcets/instance-quatrobus:/var/www instance-quatrobus

stop-container: 
	docker container stop instance-quatrobus && docker container rm instance-quatrobus

remove-container: 
	docker container rm instance-quatrobus