# jsunier/php-symfony-test

Docker image to run PHPUnit with Symfony 3.x/4.x on PHP `7.1`/`7.2`/`7.3`.

This image is published on the [Docker Hub](https://hub.docker.com) at this address : https://hub.docker.com/r/jsunier/php-symfony-test.

All the dockerfiles are available on [Gtihub](https://github.com/jsunier/php-symfony-test).

This image contains multiple versions available for testing your code with PHPUnit and Symfony.

# Usage

## Informations

For now, there is only two available database adapters for the available PHP versions:

* PostgreSQL
* MySQL/MariaDB

Every images include the latest version of [composer](https://getcomposer.org) installed at `/usr/local/bin/composer`.

List of PHP extensions installed:

| Extension / PHP version                                 |  7.1  |  7.2  |  7.3  |
| ------------------------------------------------------- | :---: | :---: | :---: |
| `mbstring`                                              |   ✅   |   ✅   |   ✅   |
| `zip`                                                   |   ✅   |   ✅   |   ✅   |
| `iconv`                                                 |   ✅   |   ✅   |   ✅   |
| `opcache`                                               |   ✅   |   ✅   |   ✅   |
| `bcmath`                                                |   ✅   |   ✅   |   ✅   |
| `pdo_mysql` (mysql/mariadb) / `pdo_pgsql` (postgresql)  |   ✅   |   ✅   |   ✅   |
| `pdo`                                                   |   ✅   |   ✅   |   ✅   |
| `imagick`                                               |   ✅   |   ✅   |   ✅   |
| `sockets`                                               |   ✅   |   ✅   |   ✅   |
| `xdebug` (2.6.1 for PHP 7.1 and 7.2 / 2.7.1 for PHP 7.3)|   ✅   |   ✅   |   ✅   |
| `gd`                                                    |   ❌   |   ❌   |   ❌   |
| `mcrypt`                                                |   ❌   |   ❌   |   ❌   |
| `oci8`                                                  |   ❌   |   ❌   |   ❌   |
| `redis`                                                 |   ❌   |   ❌   |   ❌   |

# Default configurations

Default value in Dockerfile's directives:

| Directive | Value                    |
| --------- | ------------------------ |
| `WORKDIR` | `/app`                   |
| `VOLUME`  | `[ "/app" ]`             |
| `CMD`     | `[ "/app/bin/console" ]` |

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

## All at once

There is a `Makefile` available to simplify the creation of theses images.

You can change the values inside this file to set your custom repository, folders, tags, etc.

> You need to have `make` installed (`sudo apt install make`)

### Build images with MySQL/MariaDB support

```
$ make build-mysql
$ make push-mysql
```

### Build images with PostgreSQL support

```
$ make build-postgresql
$ make push-postgresql
```

## Specific container

To build these images, just go into the folder of you choice and run `docker build . -t <your-image-name:your-tag>`.

Example:
```
# cd php7.1/mysql
# docker build . -t my-awesome-phpunit-image
```
