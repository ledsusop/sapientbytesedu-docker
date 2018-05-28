#!/bin/bash

which java

apt-key adv --recv-key --keyserver keyserver.ubuntu.com EEA14886

touch -a /etc/apt/sources.list

echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list

apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java8-installer oracle-java8-set-default

source /etc/profile

echo $JAVA_HOME