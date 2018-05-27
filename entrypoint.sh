#!/bin/bash

wget http://www.mirrorservice.org/sites/ftp.apache.org/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz
echo $(pwd)
cd /opt
sudo tar -xzvf /path/to/apache-maven-3.2.5-bin.tar.gz

export M2_HOME=/opt/apache-maven-3.2.5
export PATH=$PATH:$M2_HOME/bin

cd /root

rm -rf "/root/${PROJECT_NAME}-webapp"
curl 'https://start.fenixedu.org/webapp.zip' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' --data "groupId=org.fenixedu&artifactId=${PROJECT_NAME}-webapp&name=${PROJECT_NAME}-webapp&mavenVersion=2.3.0&bennuVersion=${BENNU_VERSION}&dbHost=localhost&dbPort=3306&dbName=fenixedu-$PROJECT_NAME&dbUser=root&dbPassword=&generate=" --compressed -o webapp.zip

unzip -o webapp.zip
VERSION=$(mvn org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression=project.version|grep -Ev '(^\[|Download\w+:)')
cd "/root/${PROJECT_NAME}-webapp"

echo "dbAlias = //$DB_HOST:$DB_PORT/$DB_DATABASE
dbUsername = $DB_USER
dbPassword = $DB_PASS
updateRepositoryStructureIfNeeded = true" > src/main/resources/fenix-framework.properties

cp /cfg/settings.xml /root/.m2
cat /cfg/configuration.properties > src/main/resources/configuration.properties


sed -e "/<dependencies>/r /cfg/dependencies.xml" -i pom.xml
sed -e "/<repositories>/r /cfg/repositories.xml" -i pom.xml
sed "s@<path>.*</path>@<path>$CONTEXT_PATH</path>@g" -i pom.xml
mvn tomcat7:run
