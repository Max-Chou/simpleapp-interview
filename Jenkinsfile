pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker-compose up -d'
            }
        }
        stage('Unit Test') {
            steps {
                sh 'docker-compose run --rm -e ENV=UNIT flasky'
            }
        }
    }
    post {
        always {
            sh 'docker-compose down'
        }
    }
}