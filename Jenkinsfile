pipeline {
    agent any

    stages {

        stage('Git Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/sanjayyy04/springboot-java-poject-maven.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Stop Old App') {
            steps {
                sh '''
                pkill -f "springboot" || true
                '''
            }
        }

       stage('Run App') {
    steps {
        sh '''
        cd $WORKSPACE
        whoami
        java -version
        nohup java -jar target/spring-boot-web.jar --server.port=8081 > app.log 2>&1 &
        '''
    }
}

    }
}
