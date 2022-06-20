FROM wordpress:php8.1-fpm

RUN apt-get update
CMD docker-compose up -d 