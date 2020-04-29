node { // node/agent
    stage ("checkout") {
        checkout scm
    }
  stage('Stage 1') {
    echo 'Hello World' // echo Hello World
  }
  stage('Stage 2') {
    def tagInCommit = sh(returnStdout: true, script: "git tag --contains | head -1").trim()
        if ("${tagInCommit}".contains('release')) {
            echo "tagname ${tagInCommit}"
        }
  }
} 