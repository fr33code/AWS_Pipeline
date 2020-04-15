FROM python:3-alpine

RUN apk add --no-cache bash jq zip
COPY requirements.txt /src/requirements.txt
RUN pip install --no-cache-dir -r /src/requirements.txt

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y default-jdk && \
    apt-get install -y ant && \
    apt-get clean;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN export JAVA_HOME

RUN echo $JAVA_HOME

# RUN apk add --update openjdk8-jre
# RUN java -version
# ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
# RUN export JAVA_HOME
# RUN curl -s "https://get.sdkman.io"
# RUN source "$HOME/.sdkman/bin/sdkman-init.sh"
# RUN sdk install gradle

ENV GRADLE_VERSION 6.3

# get gradle and supporting libs
RUN apk -U add --no-cache curl; \
    curl https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip > gradle.zip; \
    unzip gradle.zip; \
    rm gradle.zip; \
    apk del curl; \
    apk update && apk add --no-cache libstdc++ && rm -rf /var/cache/apk/*

ENV PATH=${PATH}:/gradle-${GRADLE_VERSION}/bin

RUN mkdir -p /work
RUN mkdir -p /GRADLE_CACHE

# Gradle work directory
VOLUME work

# Gradle cache directory
VOLUME GRADLE_CACHE

# WORKDIR /work

# ENTRYPOINT ["gradle", "-g", "/GRADLE_CACHE", "--no-daemon"]

