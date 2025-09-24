pipeline {
    agent any
    tools {
        jdk 'java-17'
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
              git 'https://github.com/pj013525/Java-based-Project.git'
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
                withDockerRegistry(credentialsId: 'dockerhub-creds', url: 'https://index.docker.io/v1/') {
                    sh 'docker build -t java-project-image:v1 .'
                    sh 'docker tag java-project-image:v1 pj013525/java-project-image:v1'
                    sh 'docker images'
                }
            }
        }
        stage('trivy image scan') {
            steps {
                sh 'trivy image --format table -o image-report.html pj013525/java-project-image:v1'
            }
        }
        stage('Push Image to DockerHub') {
            steps {
                withDockerRegistry(credentialsId: 'dockerhub-creds', url: 'https://index.docker.io/v1/') {
                    sh 'docker push pj013525/java-project-image:v1'
                } 
            }
        }    
        stage('Docker Container') {
            steps {
                sh 'docker run -dt --name hotstarapp -p 9090:8080 pj013525/java-project-image:v1'
            }
        }  
    }
}
