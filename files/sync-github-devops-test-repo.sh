#!/bin/bash
cd /var/jenkins_home/devops-test
gh repo sync >> /tmp/devops-test-sync-repo-logs
echo "try sync github repo ${?} " >> /tmp/devops-test-sync-repo-logs
/opt/java/openjdk/bin/java -jar /jenkins-cli.jar -s http://localhost:8080/ create-job devops-test < /devops-test.xml 