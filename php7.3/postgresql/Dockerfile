ARG COMPOSER_VERSION=latest

FROM composer:${COMPOSER_VERSION} as composer_image

FROM php:7.3-cli

ARG BUILD_DATE
ARG PRESTISSIMO_VERSION=0.3.10
ARG XDEBUG_VERSION=2.9.8

LABEL maintainer="Joël Sunier <jsunier@stogon.io>" \
    php.version="7.3" \
    php.pdo_connector="PostgreSQL" \
    php.xdebug_version=${XDEBUG_VERSION} \
    org.label-schema.build-date=${BUILD_DATE}

RUN apt-get update && apt-get install -yqq git curl libmcrypt-dev libjpeg-dev libpng-dev libfreetype6-dev libbz2-dev libxml2-dev libmagickwand-dev libpq-dev libzip-dev libwebp-dev unzip && \
    docker-php-ext-install zip opcache bcmath sockets soap && \
    docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-webp-dir=/usr/include/ && \
    docker-php-ext-install pdo_pgsql pgsql gd && \
    pecl install imagick xdebug-${XDEBUG_VERSION} redis && \
    docker-php-ext-enable imagick xdebug redis && \
    apt-get clean

COPY php.ini $PHP_INI_DIR/php.ini
COPY --from=composer_image /usr/bin/composer /usr/bin/composer

WORKDIR /app

# Create a "symfony" user
RUN groupadd --gid 1000 symfony \
  && useradd --uid 1000 --gid symfony --shell /bin/bash --create-home symfony

# Install the Symfony CLI
RUN curl -sS https://get.symfony.com/cli/installer | bash && \
  mv /root/.symfony/bin/symfony /usr/local/bin/symfony

# Fix permissions issues
RUN chmod -R a+wrx /app
RUN chmod  a+wrx /usr/bin/composer

# Fix Imagick rights for PDF
RUN rm /etc/ImageMagick-6/policy.xml

VOLUME [ "/app" ]

USER symfony
RUN composer global require --no-interaction --no-progress hirak/prestissimo:$PRESTISSIMO_VERSION

CMD [ "/app/bin/console" ]
