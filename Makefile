REPOSITORY?=jsunier/php-symfony-test
BUILD_DATE="$(shell date -u +"%Y-%m-%dT%H:%m:%SZ")"
COMPOSER_VERSION=2
VERSIONS=8.0 7.4 7.3 7.2 7.1
LATEST_VERSION=8.0

.PHONY: build
build: build-mysql build-postgresql

.PHONY: build-mysql
build-mysql:
	for VERSION in $(VERSIONS); do \
		docker build php$$VERSION/mysql --build-arg BUILD_DATE=$(BUILD_DATE) --build-arg COMPOSER_VERSION=$(COMPOSER_VERSION) -t $(REPOSITORY):php$$VERSION-mysql -t $(REPOSITORY):php$$VERSION-mariadb; \
	done
	docker build php${LATEST_VERSION}/mysql --build-arg BUILD_DATE=$(BUILD_DATE) --build-arg COMPOSER_VERSION=$(COMPOSER_VERSION) -t $(REPOSITORY):latest -t $(REPOSITORY):latest-mysql

.PHONY: build-postgresql
build-postgresql:
	for VERSION in $(VERSIONS); do \
		docker build php$$VERSION/postgresql --build-arg BUILD_DATE=$(BUILD_DATE) --build-arg COMPOSER_VERSION=$(COMPOSER_VERSION) -t $(REPOSITORY):php$$VERSION-postgresql; \
	done
	docker build php${LATEST_VERSION}/postgresql --build-arg BUILD_DATE=$(BUILD_DATE) --build-arg COMPOSER_VERSION=$(COMPOSER_VERSION) -t $(REPOSITORY):latest-postgresql

.PHONY: pull-php
pull-php:
	for VERSION in $(VERSIONS); do \
		docker pull php:$$VERSION-cli; \
	done
	docker pull php:latest
	docker pull composer:${COMPOSER_VERSION}

.PHONY: push
push: push-mysql push-postgresql

.PHONY: push-mysql
push-mysql:
	for VERSION in $(VERSIONS); do \
		docker push $(REPOSITORY):php$$VERSION-mysql; \
		docker push $(REPOSITORY):php$$VERSION-mariadb; \
	done
	docker push $(REPOSITORY):latest
	docker push $(REPOSITORY):latest-mysql

.PHONY: push-postgresql
push-postgresql:
	for VERSION in $(VERSIONS); do \
		docker push $(REPOSITORY):php$$VERSION-postgresql; \
	done
	docker push $(REPOSITORY):latest-postgresql

.PHONY: all
all: build-mysql build-postgresql push-mysql push-postgresql
