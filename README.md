# jsunier/php-symfony-test

Docker image to run PHPUnit with Symfony 3.x/4.x on PHP `7.1`/`7.2`/`7.3`.

Docker container allowing you to build and test your PHP projects.

## Supported tags and respective `Dockerfile` links

- `php7.3-mysql`, `php7.3-mariadb`, `latest`, `latest-mysql` ([7.3/Dockerfile](https://github.com/jsunier/php-symfony-test/blob/master/php7.3/mysql/Dockerfile))
- `php7.2-mysql`, `php7.2-mariadb` ([php7.2/mysql/Dockerfile](https://github.com/jsunier/php-symfony-test/blob/master/php7.2/mysql/Dockerfile))
- `php7.1-mysql`, `php7.1-mariadb` ([php7.1/mysql/Dockerfile](https://github.com/jsunier/php-symfony-test/blob/master/php7.1/mysql/Dockerfile))
- `php7.3-postgresql`, `latest-postgresql` ([php7.3/postgresql/Dockerfile](https://github.com/jsunier/php-symfony-test/blob/master/php7.3/postgresql/Dockerfile))
- `php7.2-postgresql` ([php7.2/postgresql/Dockerfile](https://github.com/jsunier/php-symfony-test/blob/master/php7.2/postgresql/Dockerfile))
- `php7.1-postgresql` ([php7.1/postgresql/Dockerfile](https://github.com/jsunier/php-symfony-test/blob/master/php7.1/postgresql/Dockerfile))

This image is published on the [Docker Hub](https://hub.docker.com) at this address : https://hub.docker.com/r/jsunier/php-symfony-test.

All the dockerfiles are available on [Github](https://github.com/jsunier/php-symfony-test).

This image contains multiple versions available for testing your code with PHPUnit and Symfony.

# Usage

## Informations

For now, there is only two available database adapters for the available PHP versions:

* PostgreSQL
* MySQL/MariaDB

Every images include the latest version of [composer](https://getcomposer.org) installed at `/usr/local/bin/composer`.

Composer is installed with [hirak/prestissimo](https://packagist.org/packages/hirak/prestissimo) to speed up packages installation.

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

# Build

## All at once

There is a `Makefile` available to simplify the creation of theses images.

You can change the values inside this file to set your custom repository, folders, tags, etc.

> You need to have `make` installed (`sudo apt install make`)

```
$ make all
```

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
