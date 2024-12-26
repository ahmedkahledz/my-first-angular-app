pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'ahmedkhaled28/angular-app'
        DOCKER_REGISTRY = 'ahmedkhaled28'  
        DOCKER_TAG = "jenkinsassignments1" 
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    // Use Jenkins credentials for Docker login
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh """
                        echo \$PASSWORD | docker login -u \$USERNAME --password-stdin
                        docker image push ${DOCKER_IMAGE}:${DOCKER_TAG}
                        """
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'docker run -d -p 8081:80 --name jenkinsassignment1 ahmedkhaled28/angular-app:jenkinsassignments1'
                }
            }
        }

    }

    post {
        success {
            echo 'Build and Dockerize successful!'
        }
    }
}
