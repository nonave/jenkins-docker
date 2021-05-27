FROM jenkins4eval/jenkins:latest
USER root
RUN apt-get update && apt-get upgrade -y && apt-get install -y maven
RUN curl -sSL https://get.docker.com | sh
RUN usermod -aG docker jenkins
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

