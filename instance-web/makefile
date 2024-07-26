build:
	docker build -t app-mcets-web .

run-container: 
	docker run --name app-mcets-web -d -p 86:80 -p 8080:8080 -v /var/www/app-mcets-web:/var/www app-mcets-web

stop-container: 
	docker container stop app-mcets-web && docker container rm app-mcets-web

remove-container: 
	docker container rm app-mcets-web