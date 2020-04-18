# AWS_Pipeline
This reposiory contains only my learnings on Jenkins, AWS Cli, and AWS Beanstalk <br>
Building AWS Pipeline <br>


> docker run --name myjenkins -p 81:8080 -p 50000:50000 container 

*Way to installjenkins as a container in your sand box*
>docker network create jenkins
>docker volume create jenkins-docker-certs
>docker volume create jenkins-data

>docker run --name jenkins-docker --rm -d --privileged --network jenkins --network-alias docker --env DOCKER_TLS_CERTDIR=/certs --volume jenkins-docker-certs:/certs/client --volume jenkins-data:/var/jenkins_home --volume <User folder in your sandbox>:/home docker:dind


>docker container run --name jenkins-tutorial --rm -d --network jenkins --env DOCKER_HOST=tcp://docker:2376 --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 --volume jenkins-data:/var/jenkins_home --volume jenkins-docker-certs:/certs/client:ro --volume <User folder in your sandbox>:/home --publish 8080:8080 jenkinsci/blueocean
 
*Once installed, then*
>docker logs jenkins-tutorial
  * Pick the password from the logs 
  * Install the default plugins

