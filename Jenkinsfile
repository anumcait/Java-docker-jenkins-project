pipeline {
    agent any
    tools {
        jdk 'jdk-17'
        maven 'maven-3'
    }
    environment {
        SCANNER_HOME = tool 'sonar-scanner'
    }

    stages {
        stage('Clean the Workspace') {
            steps {
                cleanWs()
            }
        }
        stage('Git  Checkout') {
            steps {
              git branch: 'main', url: 'https://github.com/anumcait/Java-docker-jenkins-project.git'
            }
        }
        stage('Compilingthe code') {
            steps {
                sh 'mvn compile'
            }
        }
        stage('Testing the Code') {
            steps {
                sh 'mvn test'
            }
        }
        stage('FileScan using Trivy') {
            steps {
                sh 'trivy fs --format table -o fs-report.html .'
            }
        }
        stage('Quality Analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=java \
                           -Dsonar.projectKey=java \
                           -Dsonar.sources=. \
                            -Dsonar.java.binaries=target/classes
                         '''  
                }
            }
        }
        stage('Packing the code') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Built and Tag the Image') {
            steps {
                withDockerRegistry(credentialsId: 'DOCKERHUB-CREDS', url: 'https://index.docker.io/v1/') {
                    sh 'docker build -t java-project-image:v1 .'
                    sh 'docker tag java-project-image:v1 alivenidevops/java-project-image:v1'
                    sh 'docker images'
                }
            }
        }
        stage('trivy image scan') {
            steps {
                sh 'trivy image --format table -o image-report.html alivenidevops/java-project-image:v1'
            }
        }
        stage('Push Image to DockerHub') {
            steps {
                withDockerRegistry(credentialsId: 'DOCKERHUB-CREDS', url: 'https://index.docker.io/v1/') {
                    sh 'docker push alivenidevops/java-project-image:v1'
                } 
            }
        }    
        stage('Docker Container') {
            steps {
                sh 'docker run -dt --name hotstarapp -p 9090:8080 alivenidevops/java-project-image:v1'
            }
        }  
    }
}
