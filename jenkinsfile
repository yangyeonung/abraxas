pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Git 리포지토리에서 코드 체크아웃
                git 'https://github.com/yangyeonung/abraxas'
                
                // Maven을 사용하여 빌드
                sh 'mvn clean package'
            }
        }
    }
}      
