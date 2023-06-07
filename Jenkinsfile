#!groovy

pipeline {
agent none
  stages {
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build -t python-test .'
        sh(returnStdout: true, script: 'docker run python-test')
      }
    }
  }
}