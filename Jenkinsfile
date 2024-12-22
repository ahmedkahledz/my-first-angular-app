pipeline {
    agent any

    environment {
        // Define environment variables
        IMAGE_NAME = 'ahmedkhaled28/my-angular-website'  
        DOCKER_TAG = 'latest'  
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${ahmedkhaled28/my-angular-website}:${latest}")
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
                    sh "docker push ${ahmedkhaled28/my-angular-website}:${latest}"
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

