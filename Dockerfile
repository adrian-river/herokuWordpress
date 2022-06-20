FROM ubuntu:latest

#update and install packages
RUN apt-get update
RUN apt-get install  curl apt-transport-https ca-certificates software-properties-common -y 

#install docker 
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt install docker-ce
RUN docker --version

#install docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
RUN docker-compose --version

#add directory to "vitual machine"
ADD ./webapp/docker-compose.yml /tmp/docker-compose.yml

ADD ./webapp /opt/webapp
WORKDIR /opt/webapp

#run docker-compose
RUN docker-compose up -d

EXPOSE 8000 80000
CMD ["bash"]
