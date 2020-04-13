pipeline {
    agent any

    stages {
        stage('List S3 Buckets') {
            steps {                
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_cred_key', variable: 'AWS_ACCESS_KEY_ID']]) {
                    // sh "aws configure set aws_access_key_id ${env.AWS_ACCESS_KEY_ID}"
                    // sh "aws configure set aws_secret_access_key ${env.AWS_SECRET_ACCESS_KEY}"
                    sh "aws configure set default.region ap-south-1"                    
                }
                sh "aws s3 ls"
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
