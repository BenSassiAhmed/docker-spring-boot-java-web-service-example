pipeline {
    agent any
    tools{
        jdk 'OpenJDK8'
        maven 'Maven3'
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials ('docker-credential')
    }

    stages {
        stage('Checkout') {
            steps {
                git changelog: false, poll: false, url: 'https://github.com/BenSassiAhmed/docker-spring-boot-java-web-service-example.git'
            }
        }
        stage('Maven Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Docker Build') {
            steps {
                
                sh "docker build  -t bensassiahmed/project989:version1 ."
            }
        }
        stage('Docker Login') {
            steps {
                
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Docker Push') {
            steps {
                sh 'docker push bensassiahmed/project989:version1'
            }
        }
    }
    post {
        always {
            sh 'docker logout '
        }
    }
}
