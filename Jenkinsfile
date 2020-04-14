pipeline {
    agent{
        dockerfile true
    }
    environment {
        AWS_DEFAULT_REGION = 'us-west-2'
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building Project..'
                sh 'mvn clean package'
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_cred_key', variable: 'AWS_ACCESS_KEY_ID']]) {
                    sh """\
                    aws s3 cp /var/jenkins_home/workspace/aws_pipeline/target/datasearch-eb.war s3://sonuajayin/apps/datasearch-eb.war
                    aws elasticbeanstalk create-application-version --source-bundle S3Bucket=sonuajayin,S3Key=apps/datasearch-eb.war --application-name datasearch_eb --version-label v1.6 --description \\\"hello world\\\"
                    aws elasticbeanstalk update-environment --environment-name DatasearchEb-env-1 --application-name datasearch_eb --version-label v1.6 --description \\\"heloo\\\"
                    """
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
