pipeline {
    agent any

    environment {
        IMAGE_NAME = "springboot-app"
        CONTAINER_NAME = "springboot-app"
        APP_PORT = "8081"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/sanjayyy04/springboot-java-poject-maven.git'
            }
        }

        stage('Build & Test') {
            steps {
                sh '''
                    mvn clean verify
                '''
            }
        }

        stage('Docker Build') {
            steps {
                sh '''
                    docker build -t ${IMAGE_NAME}:latest .
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true

                    docker run -d \
                      --restart unless-stopped \
                      -p ${APP_PORT}:${APP_PORT} \
                      --name ${CONTAINER_NAME} \
                      ${IMAGE_NAME}:latest
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Application deployed successfully on port ${APP_PORT}"
        }

        failure {
            echo "❌ Pipeline failed. Check logs."
        }

        cleanup {
            sh '''
                docker image prune -f || true
            '''
        }
    }
}
