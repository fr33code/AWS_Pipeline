pipeline {
    agent any

    stages {
        stage('List S3 Buckets') {
            steps {
                
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_cred_key', variable: 'AWS_ACCESS_KEY_ID']]) {
                        sh "echo this is ${env.AWS_ACCESS_KEY_ID}"
                        sh "echo this is ${env.AWS_SECRET_ACCESS_KEY}"
                }
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
