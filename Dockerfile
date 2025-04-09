FROM jenkins/jenkins:lts
USER root
RUN apt-get update && \
    apt-get install -y ansible && \
    apt-get clean
USER jenkins