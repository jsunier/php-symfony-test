# jsunier/php-symfony-test

Docker image to run PHPUnit with Symfony on PHP `7.1`/`7.2`/`7.3`.

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
* xdebug (2.6.1 for PHP 7.1 and 7.2 / 2.7.1 for PHP 7.3)

### Workdir

The default workdir is `/app`

### Volumes

The default volume is `/app`

### CMD

The default command instruction is `/app/bin/console`

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

Use `jsunier/php-symfony-test:7.2-mysql` or `jsunier/php-symfony-test:7.2-mariadb`

## PHP7.3

### PostgreSQL

Use `jsunier/php-symfony-test:7.3-postgresql`

### MySQL/MariaDB

Use `jsunier/php-symfony-test:7.3-mysql` or `jsunier/php-symfony-test:7.3-mariadb`

# Build

To build these images, just go into the folder of you choice and run `docker build . -t <your-image-name:your-tag>`.

Example:
```
# cd php7.1/postgresql
# docker build . -t my-awesome-phpunit-image
```
