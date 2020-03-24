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
* Basic Database (SQLalchemy ORM).
* Basic Authentication methods (Registration and confirmation by email).
* Bootstrap 3
* Use Flask extensions

## Usage
I highly recommand to build and run tests on containers. But I will write optional solution to deploy on metals and virtual machines.

### Docker Development and Deployment 
Requirements:
* Docker CE
* Docker Compose
* Docker Swarm

First, create initial image from Dockerfile in flasky.

`docker build -t <name_image> flasky/`

Then run the container with following commands.

`docker container run --name <name_container> -e ENV=DEV <name_image>`

Open the browser and visit on `localhost:5000`.

In development, we can make the changes of the applicaton by bind mounting.

`docker container run --name <name_container> -e ENV=DEV -v ./flasky:/flasky <name_image>`

In unit tests, we simply run the command in the container you created before.

`docker container exec -it <name_container> flask test`

Or create and run a new container.

`docker container run --name <name_container> -e ENV=UNIT <name_image>`

Next, we run the integration tests with multiple containers.

`docker-compose -f docker-compose.unittest.yml up --no-cache`

If we passes all the tests, the application is ready to deploy.
**The whole procedure can be automated by Jenkins.**

Before we deploy our application, we have to create a image and tag a versions.

`docker tag <name_image> <repository>/<name_image>:<version>`

Distribute the image on Docker Hub.

`docker push <repository>/<name_image>:<version>`
**You can use automated builds from Docker Hub.**

Finally, it's time to deploy.

`docker stack deploy -c docker-compose.prod.yml <name_stack>`

Docker Swarm is really simple container ochestration. For this simple application, Kubernetes is not necessary.