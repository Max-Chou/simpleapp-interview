# OS
FROM ubuntu:18.04

# Update and Install python3
RUN apt-get update && apt-get install -y python3 python3-pip

# Install flask and other extensions
RUN pip3 install flask flask-bootstrap flask-moment \
    flask-mail flask-sqlalchemy flask-migrate flask-wtf \
    faker flask-login flask-pagedown markdown bleach uwsgi \
    flask-httpauth

# Copy app
COPY . /flasky

# Change work directory
WORKDIR /flasky

# Environment variables (Crediential should not be here!)
ENV LC_ALL C.UTF-8
ENV LAGN C.UTF-8
ENV FLASK_APP flasky.py


EXPOSE 5000

CMD [ "/flasky/cmd.sh" ]