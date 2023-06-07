#!groovy

pipeline {
agent none
  stages {
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -t python-test .'
        sh 'docker run python-test >/dev/fd/0'
      }
    }
  }
}