# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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

[Unreleased]: https://github.com/jsunier/php-symfony-test/compare/v1.2.3...HEAD
[1.2.3]: https://github.com/jsunier/php-symfony-test/compare/v1.2.2...v1.2.3
[1.2.2]: https://github.com/jsunier/php-symfony-test/compare/v1.2.1...v1.2.2
[1.2.1]: https://github.com/jsunier/php-symfony-test/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/jsunier/php-symfony-test/compare/v1.1.2...v1.2.0
[1.1.2]: https://github.com/jsunier/php-symfony-test/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/jsunier/php-symfony-test/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/jsunier/php-symfony-test/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/jsunier/php-symfony-test/releases/tag/v1.0.0
