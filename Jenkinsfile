pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
        VERSION_NUMBER='v2.0'
        VERSION_NUMBER_OLD='v1.0'
    }
    stages {
        stage('Build') {
            steps {
                echo "stage build"
                echo "Branch ${env.BRANCH_NAME}"
            }            
        }
        // if (env.BRANCH_NAME == 'developement') { 
        //     stage('DEV') {
        //         echo 'branch dev..'
        //     }
        // }
        // if (env.BRANCH_NAME == 'master') { 
        //     stage('Staging with master') {
        //         echo 'Entered staging with only branch check for master..'
        //     }
        // }
        // if (env.BRANCH_NAME == 'master') { 
        //     stage('Prod with master') {
        //         when { tag 'release-*' }
        //         echo 'Entered prod with omaster and tag releaseg..'
        //     }
        // }
    }
}
