FROM ubuntu:latest

RUN apt-get update
RUN sudo apt install curl
RUN curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
RUN docker-compose --version
RUN docker-compose up -d

EXPOSE 8000 80000
CMD ["bash"]
