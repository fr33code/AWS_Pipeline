pipeline {
    agent any

    stages {
        stage('List S3 Buckets') {
            steps {
                sh "aws s3 ls"
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
