 Base image
FROM jenkins/jenkins:lts

# Install Tini
USER root
RUN apt-get update && apt-get install -y tini && ln -s /usr/bin/tini /sbin/tini

# Install Docker
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce

# Install Helm
RUN curl -L https://get.helm.sh/helm-v3.4.2-linux-amd64.tar.gz -o helm.tar.gz
RUN tar -zxvf helm.tar.gz
RUN mv linux-amd64/helm /usr/local/bin/
RUN rm -rf linux-amd64 helm.tar.gz

# Set the user to jenkins
USER jenkins

# Start Jenkins
CMD ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
