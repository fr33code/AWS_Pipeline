FROM jenkins/jenkins
MAINTAINER AJAY "sonu.ajay.in@gmail.com"

RUN apt-get install -y git
RUN apt-get install -y python-pip python-dev build-essential
RUN pip install awscli