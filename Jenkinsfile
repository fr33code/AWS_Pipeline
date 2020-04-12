pipeline {
    agent any

    stages {
        stage('List S3 Buckets') {
            steps {
                withAWS(credentials:'a7003bd8-c2eb-410b-b0c5-dc1ca94a9058') {
                    files = s3FindFiles(pathStyleAccessEnabled: true, bucket:'my-bucket')
                    echo files
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
