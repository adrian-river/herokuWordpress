FROM ubuntu:latest

RUN apt-get update
RUN docker-compose up -d

EXPOSE 8000 80000
CMD ["bash"]
