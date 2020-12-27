FROM ubuntu:16.04

# Install common packages and latest ansible (necessary for ansible aws collections)
RUN apt-get update && apt-get install git wget unzip openssh-client software-properties-common -y && \
apt-add-repository --yes --update ppa:ansible/ansible && apt install ansible -y

# Install terraform
RUN wget https://releases.hashicorp.com/terraform/0.12.29/terraform_0.12.29_linux_amd64.zip && \
	unzip terraform_0.12.29_linux_amd64.zip && \
	cp terraform /bin/

# Confugure ssh client
COPY /.ssh/bf_app.pem /root/.ssh/bf_app.pem
RUN chmod 600 /root/.ssh/bf_app.pem
