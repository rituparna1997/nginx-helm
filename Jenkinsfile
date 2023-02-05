pipeline {
    agent any

    stages {
        stage('helm deploy') {
            steps {
                sh 'cd /var/lib/jenkins/workspace/nginx-dep'
                sh 'sudo helm install nginx-chart nginx/ --values nginx/values.yaml'
                
            }
        }
    }
}
