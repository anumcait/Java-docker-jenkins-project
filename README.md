# Java-docker-jenkins-project

## Hotstar Clone Application

This is a Hotstar Clone Application developed using JavaScript and Java-based backend. The project demonstrates CI/CD deployment using Jenkins, Docker, and SonarQube, hosted on AWS EC2.

---

### Project Overview

- Frontend: JavaScript
- Backend: Java (Maven Project)
- CI/CD Tools: Jenkins, Docker, SonarQube, Trivy
- Version Control: Git & GitHub
- Container Registry: Docker Hub
- Cloud Hosting: AWS EC2 (Ubuntu Server)

### Prerequisites

- AWS EC2 instance (Ubuntu)
- MobaXterm or any SSH client for remote login
- GitHub repository containing the project code

### The tools used in this project are:

- AWS EC2
- Git, Github
- Maven
- Open-jdk-17
- Jenkins
- Trivy
- SoanrQube
- Docker
- Docker Hub

---

## Step by Step Project setup

### Step 1: Server Setup

- Launch an Ubuntu server on AWS EC2.

- Log in using MobaXterm/ Gitbash using key.

**Update and upgrade the server:**

```bash
sudo apt update && sudo apt upgrade -y
```

Install required tools:

**Java 17:**
```bash
sudo apt install openjdk-17-jdk -y
java -version
```

**Docker:**
```bash
sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker
docker --version
```

**Jenkins:**

```bash
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins
```

**SonarQube (via Docker):**

```bash
docker run -d — name sonar -p 9000:9000 sonarqube:lts-community
```

**Trivy (Security Scanner):**

```bash
    sudo apt-get update
    sudo apt-get install -y wget apt-transport-https gnupg lsb-release
    wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
    echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | sudo tee -a /etc/apt/sources.list.d/trivy.list

    sudo apt-get update
    sudo apt-get install -y trivy
    trivy --version
```
---

### Step 2: Jenkins Configuration

Open Jenkins in a browser: http://EC2-Public-IP:8080.

**Install recommended plugins:**

- Eclipse termiun
- SonarQube Scanner
- Sonar Quality Gates
- Docker
- Docker API
- Docker Common
- Maven Integration
- Pipeline Maven Integration
- Pipeline stage 

**Configure tools in Manage Jenkins → Global Tool Configuration:**
  
- JDK 17
- Maven
- Docker
- Sonar Scanner
- Sonar Server

**Add credentials:**
- DockerHub username and password (key-value pairs)

#### Step 3: SonarQube Setup

- Access SonarQube: http://EC2-Public-IP:9000.
- Create a user token for Jenkins.
- Create a webhook pointing (Administration --> Configuration --> Webhook) to Jenkins for code analysis triggers.
- SonarQube token Paste this Token

### Step 4: Repository Setup

Add a Dockerfile in your repo.

Add a Jenkinsfile for the CI/CD pipeline automation.

Note: Check the repository for example Dockerfile and Jenkinsfile.

### Step 5: Webhook Integration

Configure GitHub webhook to trigger Jenkins pipeline on each code commit.

Ensure pipeline builds the application, performs tests, runs SonarQube scan, and pushes Docker image to DockerHub.

### Step 6: Access Application

Once the pipeline is successfully executed, access the application at:

http://EC2-Public-IP:9090


### Tools Used
|Tool|	Purpose|
|----|----------|
|AWS EC2|	Hosting the application|
|Git/GitHub|	Version control|
|Maven	|Java project build management|
|OpenJDK 17|	Java runtime|
|Jenkins	|CI/CD automation|
|SonarQube	|Code quality analysis|
|Trivy	|Container security scanning|
|Docker	|Containerization|
|Docker Hub|	Docker image storage|

### Pipeline Overview

- Code Commit → GitHub webhook triggers Jenkins pipeline.
- Build Stage → Maven builds the project.
- Code Analysis → SonarQube performs code quality checks.
- Docker Build & Push → Docker image pushed to DockerHub.
- Deployment → Application deployed on EC2 server.

### Security & Quality

- Trivy scans Docker images for vulnerabilities.
- SonarQube enforces code quality and quality gates.

After successful setup, now click on Build the Pipeline in Jenkins, and if the build is successful, take the Public-IP:9090 (from the Pipeline)

You could see the application running

<img width="700" height="918" alt="Screenshot 2025-09-24 232406" src="https://github.com/user-attachments/assets/0176cc3b-679a-4d20-b5dc-433acfb07d60" />

<img width="700" height="848" alt="Screenshot 2025-09-24 232619" src="https://github.com/user-attachments/assets/e53e0a35-ec26-4744-96e4-a5bf16b1a3ae" />








