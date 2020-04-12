pipeline {
    agent any

    stages {
        stage('List S3 Buckets') {
            steps {
                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'a7003bd8-c2eb-410b-b0c5-dc1ca94a9058', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    sh "aws s3 ls"
                    //AWS("aws s3 ls")
                }
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
