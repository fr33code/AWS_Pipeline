node { // node/agent
  stage('Stage 1') {
    echo 'Hello World' // echo Hello World
  }
  stage('Stage 2') {
    if ((sh(returnStdout: true, script: "git tag --sort version:refname | tail -1").trim()).contains('release') && (env.BRANCH_NAME == 'master')) {
        echo 'inside commit tag'
    }
  }
} 