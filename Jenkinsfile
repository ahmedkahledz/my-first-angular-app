pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'ahmedkhaled28/angular-app'
        DOCKER_REGISTRY = 'ahmedkhaled28'  
        DOCKER_TAG = "jenkinsassignments1" 
    }

    stages {
       // stage('Checkout Code') {
      //      steps {
                // Checkout the repository
             //   git 'https://github.com/ahmedkahledz/my-first-angular-app.git'
     //       }
       // }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    // Log in to Docker registry (optional if public)
                    withDockerRegistry([credentialsId: 'dockerhub_P', url: 'https://index.docker.io/v1/']) {
                        docker.image("${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG}").push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
               script {
                    sh 'docker run -d -p 8000:3000 --name my-app michaelemad/myrepo:jenkinsassignments1'
                  }
             }
        }

    }

    post {
        always {
            // Clean up Docker images after build
            sh 'docker system prune -f'
        }

        success {
            echo 'Build and Dockerize successful!'
        }

        failure {
            echo 'Build failed, check the logs.'
        }
    }
}
