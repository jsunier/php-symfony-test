FROM php:7.1-cli

ARG BUILD_DATE
ARG PRESTISSIMO_VERSION

LABEL maintainer="Joël Sunier <jsunier@stogon.io>" \
    php.version="7.1" \
    php.pdo_connector="MySQL" \
    org.label-schema.build-date=${BUILD_DATE}

RUN apt-get update && apt-get install -yqq git curl libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev libxml2-dev libmagickwand-dev libpq-dev unzip && \
    docker-php-ext-install mbstring pdo pdo_mysql zip iconv opcache bcmath sockets && \
    pecl install imagick xdebug-2.6.1 && \
    docker-php-ext-enable imagick xdebug && \
    apt-get clean

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
