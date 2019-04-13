FROM php:7.2-cli

LABEL maintainer="Joël Sunier <jsunier@stogon.io>" \
    php.version="7.2" \
    php.pdo_connector="PostgreSQL"

RUN apt-get update && apt-get install -yqq git curl libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev libxml2-dev libmagickwand-dev libpq-dev unzip && \
    docker-php-ext-install mbstring pdo_pgsql zip iconv opcache bcmath sockets && \
    docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && \
    docker-php-ext-install pdo pdo_pgsql pgsql && \
    pecl install imagick xdebug-2.6.1 && \
    docker-php-ext-enable imagick xdebug && \
    apt-get clean

RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app

VOLUME [ "/app" ]

CMD [ "/app/bin/console" ]