#!groovy

pipeline {
agent none
  stages {
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -f Dockerfile-run-python -t python-exec .'
        sh 'docker run python-exec >/dev/fd/0'
      }
    }
  }
}