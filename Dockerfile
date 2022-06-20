FROM ubuntu:latest

#update and install packages
RUN apt-get update
RUN apt install curl -y

#install docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
RUN docker-compose --version

#add directory to "vitual machine"
ADD ./herokuWordpress/docker-compose.yml /tmp/docker-compose.yml

ADD ./herokuWordpress /opt/herokuWordpress
WORKDIR /opt/herokuWordpress

#run docker-compose
RUN docker-compose up -d

EXPOSE 8000 80000
CMD ["bash"]
