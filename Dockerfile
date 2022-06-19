FROM ubuntu:latest

RUN apt-get update
RUN cd Documents/herokuWorpress/ && sudo docker-compose up -d

CMD ["bash"]