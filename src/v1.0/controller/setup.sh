#!/bin/bash

sudo apt-get install -yq ubuntu-desktop
sudo apt-get install -yq git mysql-server
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update -yq
sudo apt-get install -yq oracle-java8-installer
sudo apt-get install -yq oracle-java8-set-default
sudo apt-get install -yq build-essential ant maven python-dev eclipse libssl1.0.0/trusty libssl-dev/trusty openssl/trusty

git clone https://github.com/floodlight/floodlight.git
cd floodlight
git submodule init
git submodule update
ant

sudo mkdir /var/lib/floodlight
sudo chmod 777 /var/lib/floodlight
