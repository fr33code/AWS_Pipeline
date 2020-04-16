pipeline {
    agent{
        dockerfile true
    }
    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
        VERSION_NUMBER='v2.0'
        VERSION_NUMBER_OLD='v1.0'
    }
    stages {
        stage('Build') {
            steps {
                sh "echo ${VERSION_NUMBER} > version.txt"
                echo 'Building Project..'
                
                sh 'gradle build'

                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh "./blue_green.sh ${VERSION_NUMBER}"
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
