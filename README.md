# simpleapp-interview
The simple project for the job interview. (junior Backend, junior DevOps)

## Features
* Flask framework and extensions
* User Registration
* Email Confirmation

## Usage
I highly recommand to build and run tests on containers. But I will write optional solution to deploy on metals and virtual machines.

### Local
Requirements:
* Linux Systems
* Python 3.6

#### Development
Create the virtual environment.

`python3 -m venv venv`

Activate the virtual environment.

`source venv/bin/activate`

Install flask and extensions.

`pip install -r requirements.txt`

Set environment variables.

```
export FLASK_APP=flasky.py
export FLASK_DEBUG=1
export SECRET='secret'
export MAIL_USERNAME='username'
export MAIL_PASSWORD='password'
export ADMIN_EMAIL='admin@example.com'
export ADMIN_PASSWORD='admin'
```

You can register a email server from other providers(mailtrap) or use your own.

Run the following commands

```
flask db upgrade
flask init
flask run
```

These commands will create initial database, create an initial admin user and roles.

Open your browser and visit `http://localhost:5000`

Perform unit tests.

`flask test`

#### Deployment

To deploy the application, you have to install wsgi server and web server.


### Container

Running this application in containers is easier than in metals.

#### Development

Run the application in development environment.

```
docker-compose -f docker-compose.dev.yml build
docker-compose -f docker-compose.dev.yml up -d
```

Run the test.

`docker container exec <container's name> flask test`

Stop and remove the container.

`docker-compose -f docker-compose.dev.yml down`

Before you deploy the application, you have to create image and distribute it on Docker Hub or other registry providers.

#### Deployment

In this example, I'll deploy the application by docker swarm.

Set the environment variables with docker secret.

`echo 'secret' | docker secret create flasky-secret`

Deploy the application by docker swarm.

`docker stack deploy -c docker-compose.prod.yml flasky`

The docker will create a proxy server and an application server. I've created the image on Docker Hub.
