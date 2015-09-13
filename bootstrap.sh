#!/bin/bash

echo "Environment installation is beginning. This may take a few minutes.."

##
#	Install core components
##

echo "Updating package repositories.."
apt-get update

echo "Installing required packages.."
apt-get -y install git

echo "Installing JDK"
wget --no-check-certificate https://github.com/aglover/ubuntu-equip/raw/master/equip_java7_64.sh && bash equip_java7_64.sh

echo "Installing Elasticsearch"
wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.1.tar.gz
tar -zxvf elasticsearch-1.7.1.tar.gz 
rm elasticsearch-1.7.1.tar.gz
cd elasticsearch-1.7.1/
echo "Installing Elasticsearch Marvel"
bin/plugin -i elasticsearch/marvel/latest
echo 'marvel.agent.enabled: false' >> ./config/elasticsearch.yml

echo "Running Elasticsearch..."
bin/elasticsearch -d

##
#	Setup is complete.
##
echo ""
echo "The environment has been installed."
echo ""
echo "You can start the machine by running: vagrant up"
echo "You can ssh to the machine by running: vagrant ssh"
echo "You can stop the machine by running: vagrant halt"
echo "You can delete the machine by running: vagrant destroy"
echo ""
exit 0