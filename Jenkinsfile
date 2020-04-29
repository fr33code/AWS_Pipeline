{
    #!groovy
    agent any

    
    stages {
        stage('Build') {     
            when { branch("master") }       
            steps {
                echo "stage build"
                echo "Branch ${env.BRANCH_NAME}"
                
            }            
        }
        stage('prod'){
            
            steps {
                echo 'Deploying only because this commit is tagged...'
                if ((sh(returnStdout: true, script: "git tag --sort version:refname | tail -1").trim()).contains('release') && (env.BRANCH_NAME == 'master')) {
                    echo 'inside commit tag'
                }
            }
            }
        }
    }
}