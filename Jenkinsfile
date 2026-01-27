pipeline {
    agent any

    stages {

        stage('Git Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/sanjayyy04/springboot-java-poject-maven.git'
            }
        }

        // stage('Build') {
        //     steps {
        //         sh 'mvn clean package'
        //     }
        // }

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

    }
}
