pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "raghav2003/simple-node-app"
        DOCKER_TAG = "latest"
        DOCKER_CREDENTIALS_ID = "dockerhub-credentials" // Jenkins credential ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/RaghavSaxena0406/simple-node-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Save the built image to a variable
                    dockerImage = docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        dockerImage.push("latest")
                    }
                }
            }
        }
    }
}
