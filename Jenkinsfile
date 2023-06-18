#!groovy

pipeline {
agent none
  stages {
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -f Dockerfile-run-python -t python-exec .'
        script {
          GIT_COMMIT_EMAIL = sh (
                script: 'docker run -it python-exec',
                returnStdout: true
            ).trim()
            echo "Git committer email: ${GIT_COMMIT_EMAIL}"
        }
      }
    }
  }
}