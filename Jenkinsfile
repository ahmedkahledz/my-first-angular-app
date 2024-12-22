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
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    // Use Jenkins credentials for Docker login
                    withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh "echo $DOCKER_PASS | docker login -u $USERNAME --password-stdin"
                        docker.image("${DOCKER_REGISTRY}/${DOCKER_IMAGE}:${DOCKER_TAG}").push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
               script {
                    sh 'docker run -d -p 8000:80 --name jenkinsassignments1 ahmeedkhaleed28/angular-app:jenkinsassignments1'
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

