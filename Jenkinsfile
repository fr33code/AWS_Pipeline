pipeline {
    agent{
        dockerfile true
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building Project..'
                sh 'mvn clean package'
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_cred_key', variable: 'AWS_ACCESS_KEY_ID']]) {
                    // sh "aws configure set aws_access_key_id ${env.AWS_ACCESS_KEY_ID}"
                    // sh "aws configure set aws_secret_access_key ${env.AWS_SECRET_ACCESS_KEY}"
                    sh "aws s3 cp /var/jenkins_home/workspace/aws_pipeline/target/datasearch-eb.war s3://sonuajayin/apps/"
                    // aws s3 rb s3://bucket-name
                }
            }            
        }
        stage('DEV') {
            steps {
                echo 'Building..'
            }
        }
        stage('Staging') {
            steps {
                echo 'Building..'
            }
        }
        stage('Production') {
            steps {
                echo 'Building..'
            }
        }
        stage('List S3 Buckets') {
            steps {                
                echo "List s3"
            }
        }
    }
}
