node { // node/agent
    stage ("checkout") {
        checkout scm
    }
  stage('Stage 1') {
    echo 'Hello World' // echo Hello World
    echo 'Hello Onece more'
  }
  def tagInCommit = sh(returnStdout: true, script: "git tag --contains | head -1").trim()
    if ("${tagInCommit}".contains('release')) {
        stage('Stage 2') {
            
                    echo "tagname ${tagInCommit}"
                    echo "cecl"
                
        }
    }
} 