pipeline {
    agent {
        docker { image 'python:3.6' }
    }

    environment {
        FLASK_APP = "flasky.app"
        SECRET_KEY = "secret"
        MAIL_USERNAME = "c560e4b4fd2dd9"
        MAIL_PASSWORD = "00b389e7c30bf1"
        FLASKY_ADMIN = "test@example.com"
    }

    stages {
        stage('Build') {
            steps {
                sh 'bash build.sh'
            }
        }

        stage('Test') {
            steps {
                sh 'bash test.sh'
            }
        }
    }
}