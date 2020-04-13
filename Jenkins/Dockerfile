FROM jenkins/jenkins
MAINTAINER AJAY "sonu.ajay.in@gmail.com"
LABEL "description"="Image contain latest awscli on top on official Jenkins image."

# USER root
# RUN curl -O https://bootstrap.pypa.io/get-pip.py \
# && python get-pip.py \
# && pip install awscli
# USER jenkins

USER root
RUN apt-get -qq update \
   && apt-get -qq -y install \
   curl

RUN curl -sSL https://get.docker.com/ | sh

RUN usermod -a -G staff jenkins

USER jenkins
