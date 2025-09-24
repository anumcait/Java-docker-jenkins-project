<<<<<<< HEAD
<<<<<<< HEAD
# Java-docker-jenkins-project
=======
Hotstar Clone Application

This is a Hotstar Clone Application developed using JavaScript and Java-based backend. The project demonstrates CI/CD deployment using Jenkins, Docker, and SonarQube, hosted on AWS EC2.

Project Overview

Frontend: JavaScript

Backend: Java (Maven Project)

CI/CD Tools: Jenkins, Docker, SonarQube, Trivy

Version Control: Git & GitHub

Container Registry: Docker Hub

Cloud Hosting: AWS EC2 (Ubuntu Server)

Prerequisites

AWS EC2 instance (Ubuntu)

MobaXterm or any SSH client for remote login

GitHub repository containing the project code

Step 1: Server Setup

Launch an Ubuntu server on AWS EC2.

Log in using MobaXterm.

Update and upgrade the server:

sudo apt update && sudo apt upgrade -y


Install required tools:

Java 17:

sudo apt install openjdk-17-jdk -y
java -version


Docker:

sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
docker --version


Jenkins:

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins


SonarQube (via Docker):

docker run -d --name sonarqube -p 9000:9000 sonarqube:latest


Trivy (Security Scanner):

sudo apt install trivy -y
trivy --version

Step 2: Jenkins Configuration

Open Jenkins in a browser: http://<EC2-Public-IP>:8080.

Install recommended plugins:

Eclipse Terminal

SonarQube Scanner

Sonar Quality Gates

Docker

Docker API

Docker Common

Configure tools in Manage Jenkins → Global Tool Configuration:

JDK 17

Maven

Docker

Sonar Scanner

Sonar Server

Add credentials:

SonarQube token

DockerHub username and password (key-value pairs)

Step 3: SonarQube Setup

Access SonarQube: http://<EC2-Public-IP>:9000.

Create a user token for Jenkins.

Create a webhook pointing to Jenkins for code analysis triggers.

Step 4: Repository Setup

Add a Dockerfile in your repo.

Add a Jenkinsfile for the CI/CD pipeline automation.

Note: Check the repository for example Dockerfile and Jenkinsfile.

Step 5: Webhook Integration

Configure GitHub webhook to trigger Jenkins pipeline on each code commit.

Ensure pipeline builds the application, performs tests, runs SonarQube scan, and pushes Docker image to DockerHub.

Step 6: Access Application

Once the pipeline is successfully executed, access the application at:

http://<EC2-Public-IP>:9090

Tools Used
Tool	Purpose
AWS EC2	Hosting the application
Git/GitHub	Version control
Maven	Java project build management
OpenJDK 17	Java runtime
Jenkins	CI/CD automation
SonarQube	Code quality analysis
Trivy	Container security scanning
Docker	Containerization
Docker Hub	Docker image storage
Pipeline Overview

Code Commit → GitHub webhook triggers Jenkins pipeline.

Build Stage → Maven builds the project.

Code Analysis → SonarQube performs code quality checks.

Docker Build & Push → Docker image pushed to DockerHub.

Deployment → Application deployed on EC2 server.

Security & Quality

Trivy scans Docker images for vulnerabilities.

SonarQube enforces code quality and quality gates.
>>>>>>> 19e802b (Update README.md)
=======

>>>>>>> 9e54412 (Update README.md)
This is a Hotstar clone Application that was written using JavaScript. It is a Java-based project
-------

The tools used in this project are:
~~~
AWS EC2
Git, Github
Maven
Open-jdk-17
Jenkins
Trivy
SoanrQube
Docker
Docker Hub
~~~
---------

Launch a Ubuntu server and log in to it using the Mobaxterm agent

Now install java-17, Jenkins, docker, trivy, SonarQube(using docker)
-------

Now log in to Jenkins and set up all the details

In the Jenkins server, install all the plugins like
~~~
Eclipse termiun
Sonar server and Sonar quality gates
Docker, Docker API, Docker common  from the available plugins section
~~~
Now install tools in Jenkins, such as:
~~~
JDK, 
sonar-server, 
sonar-scanner,
docker,
maven 
~~~
-------

Now, go to SonarQube home using IP:9000 and create a token and webhook using Jenkins URL
--------

Paste this Token in the credentials section in Jenkins \
Also, give Dockerhub credentials in the form of  key-value pairs
--------

Now add Dockerfile to the Repo
Note:- for Dockerfile, check the GitHub repo
======

Add a Jenkinsfile with all the pipeline in it to automate the CI/CD deployment in the repository
Note:- For Jenkinsfile, check the GitHub repo
======
-------

Now set up the Webhook so that whenever changes are committed to the code, it will trigger the pipeline automatically
--------

After successful setup, now click on Build the Pipeline in Jenkins, and if the build is successful, take the Public-IP:9090 (from the Pipeline)

<img width="1344" height="674" alt="ShareX_WRKCyzj9MN" src="https://github.com/user-attachments/assets/a5ce1927-de3d-4fc3-8b19-e17352e0ac0b" />





