pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh '''
                docker build -t flasky:1.0 ./flasky/
                docker container run -d -p 5000:5000 -e ENV=DEV --name flasky flasky:1.0
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
}