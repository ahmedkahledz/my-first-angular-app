pipeline {
    agent any

    environment {
        // Define environment variables
        DOCKERHUB_CREDENTIALS = 'dockerhub-creds'  // Jenkins credential ID for DockerHub credentials
        IMAGE_NAME = 'your-dockerhub-username/your-image-name'  // Replace with your DockerHub username and image name
        DOCKER_TAG = 'latest'  // You can customize the tag (e.g., use the Git commit hash or build number)
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${IMAGE_NAME}:${DOCKER_TAG}")
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                script {
                    // Login to DockerHub using Jenkins credentials
                    withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Push the Docker image to DockerHub
                    sh "docker push ${IMAGE_NAME}:${DOCKER_TAG}"
                }
            }
        }
    }

    post {
        always {
            // Clean up the Docker image after the build is complete
            cleanWs()
        }

        success {
            // Print a success message when the pipeline finishes successfully
            echo "Docker image pushed successfully!"
        }

        failure {
            // Print a failure message when the pipeline fails
            echo "The pipeline failed!"
        }
    }
}
