pipeline {
    agent any 
    environment {
    DOCKERHUB_CREDENTIALS = credentials('docker')
    }
    stages { 
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/MrAnshulG/React-Gym-Website-master.git'
            }
        }

        stage('Build docker image') {
            steps {  
                sh 'docker build -t anshulganvir/tomcat:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push anshulganvir/tomcat:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
