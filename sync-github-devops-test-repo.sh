#!/bin/bash
cd /var/jenkins_home/devops-test
gh repo sync >> /tmp/devops-test-sync-repo-logs
echo "try sync github repo ${?} " >> /tmp/devops-test-sync-repo-logs
