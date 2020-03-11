#!/bin/bash

python3 -m venv venv
source venv/bin/activate
pip3 install flask
pip3 install flask-bootstrap
pip3 install flask-moment
pip3 install flask-wtf
pip3 install flask-sqlalchemy
pip3 install flask-migrate
pip3 install flask-mail