# simpleapp-interview
The simple blog app with Flask framework and SQL Database.

## Features
* Blog
* User Registration and Authentication
* Post an article and comment
* Moderate comments

### To Do:
* Authentication from Google, Twitter or other platforms
* Upload files
* Deployment

## Requirements

* Linux Systems, Ubuntu 18.04 or CentOS 7
* Python 3.6
* Docker Engine (Optional)
* Docker Compose

## Usage

### Docker

The simple way to try the app is using Docker.

First, build the image from Dockerfile.

`docker-compose build`

Second, build the whole application, including Nginx and postgreSQL.

`docker-compose up -d`

### Development on your machine
**Extensions**
* flask-bootstrap(Bootstrap 3)
* flask-moment
* flask-login
* flask-mail
* flask-sqlalchemy
* flask-migrate
* flask-wtf
* flask-pagedown
* markdown
* bleach
* uwsgi or gunicorn
* flask-httpauth
* psycopg2-binary
* coverage (Optional, test only)
* selenium (Optional, test only)

Suppose that you're familiar with the virtual environment in python or install the anaconda.

`python3 -m venv venv`
`conda create --name flask python=3.6`

Install the extensions and other libraries

`pip install -r requirements.txt`

**Environment Variables**

* SECRET_KEY

Used for encryption.

* MAIL_USERNAME
* MAIL_PASSWORD

Used for Mail Service.

* ADMIN_EMAIL
* ADMIN_PASSWORD

Used to create admin account.

* DEV\_DATABASE\_URL (optional)

Choose database engine. The default is SQLite.

* FLASKY_CONFIG (optional)

Choose configuration. The default is development.

### Deployment
Simple way to deploy is using PaaS service like Heroku. 
