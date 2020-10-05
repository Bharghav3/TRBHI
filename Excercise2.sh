#!/bin/bash
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common 
curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add - 
sudo add-apt-repository \
    "deb https://apt.dockerproject.org/repo/ \
    ubuntu-$(lsb_release -cs) \
    main" 
sudo apt-get update
sudo apt-get -y install docker-engine 
# add current user to docker group so there is no need to use sudo when running docker
sudo usermod -aG docker $(whoami)

#Get elastic search running in a docker container
sudo docker run -p 9200:9200 -p 9300:9300 --name elasticsearch -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.6.1

#Check the health of elastic search from the command line
sudo curl http://127.0.0.1:9200/_cat/health