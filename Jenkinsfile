pipeline {
    agent any

    stages {

        stage('Git Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/sanjayyy04/springboot-java-poject-maven.git'
            }
        }

        stage('Compile') {
            steps {
                sh 'mvn compile'
            }
        }

          stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

          stage('Package') {
            steps {
                sh 'mvn clean package'
            }
        }

          stage('install') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('run the application') {
            steps {
               sh '''
                nohup java -jar target/spring-boot-web.jar \
                --server.port=8081 \
                > app.log 2>&1 &
                '''
            } 
        }

        stage('docker build image') {
            steps {
               sh 'docker build -t maver-image .'
               sh ' image builded sucessfully'
               
            } 
        }
        
    }
}
