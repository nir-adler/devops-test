#!groovy

pipeline {
agent none
  stages {
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -f Dockerfile-run-python -t python-exec .'
        BUILD_FULL = sh (
          script: "docker run python-exec",
          returnStatus: true
        ) == 0
        echo "Build full flag: ${BUILD_FULL}"
      }
    }
  }
}