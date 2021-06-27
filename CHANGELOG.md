# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.3.1]
### Added
- Added PHP 8.0 images

## [1.3.0] - 2021-02-14
### Changes
- Upgraded composer executable to **v2.x**
- Removed `hirak/prestissimo` composer plugin

## [1.2.6] - 2020-10-24
### Added
- Added the [Symfony CLI](https://symfony.com/download) to `/usr/local/bin/symfony` in all images

## [1.2.5] - 2020-10-24
### Added
- Added `COMPOSER_VERSION` argument in all `Dockerfile` to specify which composer version to install (default to `latest` in Dockerfile, `1` in `Makefile`)
- Added `XDEBUG_VERSION` argument in all `Dockerfile` to specify which version of `xdebug` to install

### Changes
- Changed the way composer is installed in images by using `COPY --from=composer:${COMPOSER_VERSION} /usr/bin/composer /usr/bin/composer`
- Changed path of composer executable from `/usr/local/bin/composer` to `/usr/bin/composer`

### Fixed
- Fixed unused `PRESTISSIMO_VERSION` argument during build
- Removed `docker-php-ext-install` instruction for already installed extensions (like `pdo`, `iconv`, `mbstring`)

## [1.2.4] - 2020-09-14
### Fixed
- Fixed `ImagickException: attempt to perform an operation not allowed by the security policy 'PDF' @ error/constitute.c/IsCoderAuthorized/408` error when trying to read a PDF with Imagick extension.

## [1.2.3] - 2020-06-28
### Added
- Added `CHANGELOG.md`

## [1.2.2] - 2020-05-24
### Added
- `redis` PECL extensions for all images
- Update `README.md` to include `Symfony 5` version

### Fixed
- Typo in `Makefile`

## [1.2.1] - 2020-03-08
### Added
- Support for `webp` images with GD extension in all versions

### Changes
- Upgraded [hirak/prestissimo](https://packagist.org/packages/hirak/prestissimo) to `0.3.10`

### Fixed
- Missing `.PHONY:` directives in `Makefile`

## [1.2.0] - 2019-12-28
### Added
- PHP 7.4 images

## [1.1.2] - 2019-11-10
### Added
- Custom `php.ini` file for each PHP image

### Fixed
- Fixed memory limitations by setting the `memory_limit` in `php.ini` to `-1`

## [1.1.1] - 2019-10-22
### Added
- `soap` and `GD` extensions to all PHP images

## [1.1.0] - 2019-10-22
### Added

- Added a `Makefile` to simplify the building of images
- Added [hirak/prestissimo](https://packagist.org/packages/hirak/prestissimo) to speed up packages installation.

### Changed

- **BREAKING CHANGES** : ⚠️ Default user is now `symfony` instead of `root` when running container ⚠️

If you used `apt-get ...` or something that require `root` privileges before this version, make sure to update your Dockerfile or CI script !

## [1.0.0] - 2019-04-19
### Added
- Added images for PHP `7.3`
- Replaced `MAINTAINER` directive by a `LABEL` directive
- Added a default workdir (`/app`)
- Added a default volume (`/app`)
- Added a CMD directive on all images (default to `/app/bin/console`)

[Unreleased]: https://github.com/jsunier/php-symfony-test/compare/v1.3.0...HEAD
[1.3.1]: https://github.com/jsunier/php-symfony-test/compare/v1.3.0...v1.3.1
[1.3.0]: https://github.com/jsunier/php-symfony-test/compare/v1.2.6...v1.3.0
[1.2.6]: https://github.com/jsunier/php-symfony-test/compare/v1.2.5...v1.2.6
[1.2.5]: https://github.com/jsunier/php-symfony-test/compare/v1.2.4...v1.2.5
[1.2.4]: https://github.com/jsunier/php-symfony-test/compare/v1.2.3...v1.2.4
[1.2.3]: https://github.com/jsunier/php-symfony-test/compare/v1.2.2...v1.2.3
[1.2.2]: https://github.com/jsunier/php-symfony-test/compare/v1.2.1...v1.2.2
[1.2.1]: https://github.com/jsunier/php-symfony-test/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/jsunier/php-symfony-test/compare/v1.1.2...v1.2.0
[1.1.2]: https://github.com/jsunier/php-symfony-test/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/jsunier/php-symfony-test/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/jsunier/php-symfony-test/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/jsunier/php-symfony-test/releases/tag/v1.0.0
