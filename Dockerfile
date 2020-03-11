# OS
FROM ubuntu:18.04

# Update and Install python3
RUN apt update && apt install -y python3 python3-pip

# Install flask and other extensions
RUN pip3 install flask flask-bootstrap flask-moment \
    flask-mail flask-sqlalchemy flask-migrate flask-wtf

# Copy app
COPY . /flasky

# Change work directory
WORKDIR /flasky

# Environment variables (Crediential should not be here!)
ENV LC_ALL C.UTF-8
ENV LAGN C.UTF-8
ENV FLASK_APP flasky.py
ENV SECRET_KEY secret
ENV MAIL_USERNAME c560e4b4fd2dd9
ENV MAIL_PASSWORD 00b389e7c30bf1
ENV FLASKY_ADMIN test@example.com

# Create database
RUN flask db init
RUN flask db migrate
RUN flask db upgrade

EXPOSE 5000

CMD [ "flask", "run", "--host=0.0.0.0" ]