FROM jenkins/jenkins:2.401.1
RUN echo "test9"
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
RUN jenkins-plugin-cli --plugins "github:1.37.1"
USER root
RUN apt update -y
RUN curl -o /gh.deb -L https://github.com/cli/cli/releases/download/v2.30.0/gh_2.30.0_linux_arm64.deb
RUN dpkg -i /gh.deb 
RUN apt-get install -f -y
USER root
RUN apt update -y
RUN apt install cron -y
RUN cron
COPY ./files/sync-github-devops-test-repo.sh /sync-github-devops-test-repo.sh
COPY ./files/jenkins.sh /usr/local/bin/jenkins.sh
RUN chown  jenkins:jenkins /sync-github-devops-test-repo.sh
RUN chown  root:root /usr/local/bin/jenkins.sh
RUN apt -y install systemctl
RUN systemctl is-enabled cron
RUN  chmod u+s /usr/sbin/cron
USER jenkins 
RUN cd /var/jenkins_home && echo "* * * * * (/sync-github-devops-test-repo.sh)" >> mycron
RUN cd /var/jenkins_home && echo "* * * * * (sleep 10 ; /sync-github-devops-test-repo.sh)" >> mycron
RUN cd /var/jenkins_home && echo "* * * * * (sleep 20 ; /sync-github-devops-test-repo.sh)" >> mycron
RUN cd /var/jenkins_home && echo "* * * * * (sleep 30 ; /sync-github-devops-test-repo.sh)" >> mycron
RUN cd /var/jenkins_home && echo "* * * * * (sleep 40 ; /sync-github-devops-test-repo.sh)" >> mycron
RUN cd /var/jenkins_home && echo "* * * * * (sleep 50 ; /sync-github-devops-test-repo.sh)" >> mycron
RUN cd /var/jenkins_home && crontab mycron
RUN crontab -l
COPY ./files/jenkins-cli.jar /jenkins-cli.jar
COPY ./files/devops-test.xml /devops-test.xml
USER root 
RUN chown  jenkins:jenkins /jenkins-cli.jar
RUN chown  jenkins:jenkins /devops-test.xml
RUN apt update && apt install nano -y
RUN apt update && apt install file -y
USER jenkins


