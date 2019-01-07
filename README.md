# jsunier/php-symfony-test

Docker image to run PHPUnit with Symfony on PHP7.1/PHP7.2.

The image is published on the [Docker Hub](https://hub.docker.com) at this address : https://hub.docker.com/r/jsunier/php-symfony-test.

This image contains multiple versions available for testing your code with PHPUnit and Symfony.

# Usage

## Informations

For now, there is only two available database adapters for the available PHP versions:

* PostgreSQL
* MySQL/MariaDB

Every images include the latest version of [composer](https://getcomposer.org).

List of PHP extensions installed:

* mbstring
* zip
* iconv
* opcache
* bcmath
* pdo
* imagick
* sockets
* xdebug (2.6.1)

### Architectures available

Images are compiled for these architectures:

* `amd64`

## PHP7.1

### PostgreSQL

Use `jsunier/php-symfony-test:7.1-postgresql`

### MySQL/MariaDB

Use `jsunier/php-symfony-test:7.1-mysql` or `jsunier/php-symfony-test:7.1-mariadb`

## PHP7.2

### PostgreSQL

Use `jsunier/php-symfony-test:7.2-postgresql`

### MySQL/MariaDB

Use `jsunier/php-symfony-test:7.1-mysql` or `jsunier/php-symfony-test:7.1-mariadb`

# Build

To build these images, just go into the folder of you choice and run `docker build . -t <your-image-name:your-tag>`.

Example:
```
# cd php7.1/postgresql
# docker build . -t my-awesome-phpunit-image
```
