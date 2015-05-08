#!/bin/bash

docker run -P -d -e MYSQL_ROOT_PASSWORD=root -e MYSQL_USER=dbuser -e MYSQL_PASSWORD=dbpass -e MYSQL_DATABASE=test --name db-$1 mysql:5.5

docker run -P -d -e spring.datasource.url=jdbc:mysql://db/test --name web-$1 --link db-$1:db erneszt/hello-app:v10 ./gradlew bootRun