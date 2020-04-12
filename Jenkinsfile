pipeline {
    agent any

    stages {
        stage('List S3 Buckets') {
            steps {
                sh "docker run --rm -ti -v ~/.aws:/root/.aws amazon/aws-cli s3 ls"
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
