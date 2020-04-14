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
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        
                        sh """\
                    aws s3 cp /var/jenkins_home/workspace/aws_pipeline/target/datasearch-eb.war s3://sonuajayin/apps/datasearch-eb.war
                    aws elasticbeanstalk create-application-version \
                        --application-name "datasearch_eb" \
                        --version-label "v2" \
                        --source-bundle "S3Bucket=sonuajayin,S3Key=apps/datasearch-eb.war" \
                        --process \
                        --auto-create-application \
                        --query 'ApplicationVersion.VersionLabel' \
                        --output text
                    aws elasticbeanstalk update-environment --environment-name DatasearchEb-env-1 --application-name datasearch_eb --version-label v2
                    """
                }

                
                // withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_cred_key']]) {
                //     sh """\
                //     aws s3 cp /var/jenkins_home/workspace/aws_pipeline/target/datasearch-eb.war s3://sonuajayin/apps/datasearch-eb.war
                //     aws elasticbeanstalk create-application-version \
                //         --application-name "datasearch_eb" \
                //         --version-label "1.6" \
                //         --source-bundle "S3Bucket=sonuajayin,S3Key=apps/datasearch-eb.war" \
                //         --process \
                //         --auto-create-application \
                //         --query 'ApplicationVersion.VersionLabel' \
                //         --output text
                //     aws elasticbeanstalk update-environment --environment-name DatasearchEb-env-1 --application-name datasearch_eb --version-label v1.6
                //     """
                // }
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
