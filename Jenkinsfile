pipeline {   
    agent any 

    stages {
        stage('Git checkout') {
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/sanjayyy04/springboot-java-poject-maven.git'
            }
        }
        
        stage('Compile') {
            steps {
                sh "mvn compile"
                 }
        }
        
        stage('Package') {
            steps {
                sh "mvn clean install"
                
                 }
        }
        
        stage('Run App') {
            steps {
                sh """
                nohup java -jar target/*.jar --server.port=8081 > app.log 2>&1 &
                """
    }
}

         
    }
}
