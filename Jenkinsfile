pipeline {
    agent{
        dockerfile true
    }
    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
        VERSION_NUMBER='v1.2'
    }
    stages {
        stage('Build') {
            steps {
                sh "echo ${VERSION_NUMBER} > version.txt"
                echo 'Building Project..'
                sh 'gradle build'
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        
                        sh """\
                    aws s3 cp /var/jenkins_home/workspace/aws_pipeline/build/libs/java-sample-app-${VERSION_NUMBER}.jar s3://sonuajayin/apps/java-sample-app-${VERSION_NUMBER}.jar
                    aws elasticbeanstalk create-application-version \
                        --application-name "datasearch_demo" \
                        --version-label "${VERSION_NUMBER}" \
                        --source-bundle "S3Bucket=sonuajayin,S3Key=apps/java-sample-app-${VERSION_NUMBER}.jar" \
                        --process \
                        --auto-create-application \
                        --query 'ApplicationVersion.VersionLabel' \
                        --output text
                    aws elasticbeanstalk update-environment --environment-name DatasearchDemo-env --application-name datasearch_demo --version-label ${VERSION_NUMBER}
                    """
                    // sh "
                    // aws elasticbeanstalk create-environment --application-name datasearch_eb --environment-name dataSearch-dev --template-name dataSearch-config  --version-label v2"
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
