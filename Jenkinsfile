pipeline {
    agent{
        dockerfile true
    }
    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building Project..'
                sh 'mvn clean package'
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_cred_key', variable: 'AWS_ACCESS_KEY_ID']]) {
                    // sh "aws configure set aws_access_key_id ${env.AWS_ACCESS_KEY_ID}"
                    // sh "aws configure set default.region ap-south-1"
                    echo "copy artifact"
                    sh "aws s3 cp /var/jenkins_home/workspace/aws_pipeline/target/datasearch-eb.war s3://sonuajayin/apps/"
                    // aws s3 rb s3://bucket-name
                    echo "create version"
                    sh "aws elasticbeanstalk create-application-version --application-name datasearch_eb --version-label v1.5 --source-bundle S3Bucket=sonuajayin,S3Key=apps/datasearch-eb.war"
                    echo "deploy"
                    sh "aws elasticbeanstalk update-environment --application-name datasearch-eb --environment-name DatasearchEb-env-1 --version-label v1.5"
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
