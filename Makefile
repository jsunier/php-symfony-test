REPOSITORY?=jsunier/php-symfony-test

build-mysql:
	docker build php7.1/mysql -t $(REPOSITORY):php7.1-mysql -t $(REPOSITORY):php7.1-mariadb
	docker build php7.2/mysql -t $(REPOSITORY):php7.2-mysql -t $(REPOSITORY):php7.2-mariadb
	docker build php7.3/mysql -t $(REPOSITORY):php7.3-mysql -t $(REPOSITORY):php7.3-mariadb

build-postgresql:
	docker build php7.1/postgresql -t $(REPOSITORY):php7.1-postgresql
	docker build php7.2/postgresql -t $(REPOSITORY):php7.2-postgresql
	docker build php7.3/postgresql -t $(REPOSITORY):php7.3-postgresql

push-mysql:
	docker push $(REPOSITORY):7.1-mysql
	docker push $(REPOSITORY):7.1-mariadb
	docker push $(REPOSITORY):7.2-mysql
	docker push $(REPOSITORY):7.2-mariadb
	docker push $(REPOSITORY):7.3-mysql
	docker push $(REPOSITORY):7.3-mariadb

push-postgresql:
	docker push $(REPOSITORY):7.1-postgresql
	docker push $(REPOSITORY):7.2-postgresql
	docker push $(REPOSITORY):7.3-postgresql

all: build-mysql build-postgresql push-mysql push-postgresql

.PHONY: all
