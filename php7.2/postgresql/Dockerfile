FROM php:7.2-cli

ARG BUILD_DATE
ARG PRESTISSIMO_VERSION

LABEL maintainer="Joël Sunier <jsunier@stogon.io>" \
    php.version="7.2" \
    php.pdo_connector="PostgreSQL" \
    org.label-schema.build-date=${BUILD_DATE}

RUN apt-get update && apt-get install -yqq git curl libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev libxml2-dev libmagickwand-dev libpq-dev unzip && \
    docker-php-ext-install mbstring pdo_pgsql zip iconv opcache bcmath sockets soap && \
    docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install pdo pdo_pgsql pgsql gd && \
    pecl install imagick xdebug-2.6.1 && \
    docker-php-ext-enable imagick xdebug && \
    apt-get clean

COPY php.ini $PHP_INI_DIR/php.ini

RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app

# Create a "symfony" user
RUN groupadd --gid 1000 symfony \
  && useradd --uid 1000 --gid symfony --shell /bin/bash --create-home symfony

# Fix permissions issues
RUN chmod -R a+wrx /app
RUN chmod  a+wrx /usr/local/bin/composer

VOLUME [ "/app" ]

USER symfony
RUN composer global require --no-interaction --no-progress hirak/prestissimo:0.3.9

CMD [ "/app/bin/console" ]
