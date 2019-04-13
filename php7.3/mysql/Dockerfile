FROM php:7.3-cli

LABEL maintainer="Joël Sunier <jsunier@stogon.io>" \
    php.version="7.3" \
    php.pdo_connector="MySQL"

RUN apt-get update && apt-get install -yqq git curl libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev libxml2-dev libmagickwand-dev libpq-dev libzip-dev unzip && \
    docker-php-ext-install mbstring pdo pdo_mysql zip iconv opcache bcmath sockets && \
    pecl install imagick xdebug-2.7.1 && \
    docker-php-ext-enable imagick xdebug && \
    apt-get clean

RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app

VOLUME [ "/app" ]

CMD [ "/app/bin/console" ]