basic-docker
============

Dockerized Basic Project

From Source

	docker build -t juanjmerono/basic github.com/juanjmerono/basic-docker
	docker run -d -p 3000:3000 -p 3001:3001 juanjmerono/basic
	
From Binary

	docker pull juanjmerono/basic
	docker run -d -p 3000:3000 -p 3001:3001 juanjmerono/basic
