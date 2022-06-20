FROM alpine:3.16.0

RUN apt-get update
RUN docker-compose up -d

EXPOSE 8000 80000
CMD ["bash"]
