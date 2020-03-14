pipeline {
    agent any

    environment {
        SECRET_KEY = credentials('SECRET_KEY')
        MAIL_USERNAME = credentials('MAIL_USERNAME')
        MAIL_PASSWORD = credentials('MAIL_PASSWORD')
    }

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t flasky:1.0 ./flasky/'
                sh '''
                docker container run -d -p 5000:5000 -e ENV=DEV \
                -e SECRET_KEY=$SECRET_KEY -e MAIL_USERNAME=$MAIL_USERNAME -e MAIL_PASSWORD=$MAIL_PASSWORD \
                --name flasky flasky:1.0
                '''
            }
        }
        stage('Unit Test') {
            steps {
                sh '''
                docker container exec flasky flask test
                '''
            }
        }
    }
    post {
        always {
            sh 'docker container rm -f flasky'
        }
    }
}