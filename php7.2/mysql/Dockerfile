FROM php:7.2-cli

MAINTAINER Joël Sunier <jsunier@stogon.io>

RUN apt-get update && apt-get install -yqq git curl libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev libxml2-dev libmagickwand-dev libpq-dev && \
    docker-php-ext-install mbstring pdo pdo_mysql zip iconv opcache bcmath && \
    pecl install imagick && \
    docker-php-ext-enable imagick && \
    apt-get clean
  
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
