REPOSITORY?=jsunier/php-symfony-test
BUILD_DATE="$(shell date -u +"%Y-%m-%dT%H:%m:%SZ")"
PRESTISSIMO_VERSION=0.3.9
VERSIONS=7.3 7.2 7.1
LATEST_VERSION=7.3

build-mysql:
	for VERSION in $(VERSIONS); do \
		docker build php$$VERSION/mysql --build-arg PRESTISSIMO_VERSION=$$PRESTISSIMO_VERSION --build-arg BUILD_DATE=$$BUILD_DATE -t $(REPOSITORY):php$$VERSION-mysql -t $(REPOSITORY):php$$VERSION-mariadb; \
	done
	docker build php${LATEST_VERSION}/mysql --build-arg PRESTISSIMO_VERSION=$$PRESTISSIMO_VERSION --build-arg BUILD_DATE=$$BUILD_DATE -t $(REPOSITORY):latest -t $(REPOSITORY):latest-mysql

build-postgresql:
	for VERSION in $(VERSIONS); do \
		docker build php$$VERSION/postgresql --build-arg PRESTISSIMO_VERSION=$$PRESTISSIMO_VERSION --build-arg BUILD_DATE=$$BUILD_DATE -t $(REPOSITORY):php$$VERSION-postgresql; \
	done
	docker build php${LATEST_VERSION}/postgresql --build-arg PRESTISSIMO_VERSION=$$PRESTISSIMO_VERSION --build-arg BUILD_DATE=$$BUILD_DATE -t $(REPOSITORY):latest-postgresql

push-mysql:
	for VERSION in $(VERSIONS); do \
		docker push $(REPOSITORY):php$$VERSION-mysql; \
		docker push $(REPOSITORY):php$$VERSION-mariadb; \
	done
	docker push $(REPOSITORY):latest
	docker push $(REPOSITORY):latest-mysql

push-postgresql:
	for VERSION in $(VERSIONS); do \
		docker push $(REPOSITORY):php$$VERSION-postgresql; \
	done
	docker push $(REPOSITORY):latest-postgresql

all: build-mysql build-postgresql push-mysql push-postgresql

.PHONY: all
