# simpleapp-interview
The simple project for the job interview. (junior Backend, junior DevOps)

* Python Flask framework
* SQLAlchemy ORM
* Registration System
* Email Confirmation

## System Requirements
* Linux Operating System
* Python 3.6
* Web-Server (Nginx or Apache)
* Docker Swarm Supported

## Features
* Clone project from GitHub
* Use Docker for build, unit test and integration test
* Use Docker Swarm for deployment
* Use Flask extensions

## Installation

### Docker 

Requirements:
* Docker CE
* Docker Compose
* Docker Swarm

Run the application on development environment:
`docker-compose -f docker-compose.yml -f docker-compose.overide.yml up -d`

The application hosts on `localhost:5000`

Run the unit test:
`docker-compose -f docker-compose.yml -f docker-compose.unittest.yml up -d`

Set your credentials by docker secret before deployment.

Deploy the application on docker swarm:
`docker stack deploy -c docker-compose.prod.yml`


### Additional Information

Create Image
`docker build -t flasky flasky/`

Run app
`docker container run --name flasky -e ENV=DEV flasky`

Run unit test
`docker container run --name flasky -e ENV=UNIT flasky`

Integration with proxy server and database
`docker-compose -f docker-compose.yml -f docker-compose.overide.yml build`
`docker-compose -f docker-compose.yml -f docker-compose.overide.yml up -d`

Tag image and push to docker hub
`docker tag flasky <username>/flasky:<version>`
`docker push <username>/flasky:<version>`

Docker Secrets
`echo "pass" | docker secret create <secret> -`

Deploy on docker swarm
`docker stack deploy -c docker-compose.prod.yml flasky`