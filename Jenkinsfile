node { // node/agent
  stage('Stage 1') {
    echo 'Hello World' // echo Hello World
  }
  stage('Stage 2') {
    def tagInCommit = sh(returnStdout: true, script: "git tag --contains").trim()
        if ("${tagInCommit}".contains('release') && (env.BRANCH_NAME == 'master')) {
            echo "tagname ${tagInCommit}"
        }
  }
} 