.PHONY: all test clean help

help:                                                      ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

##
up_fuseki: create_vm install_docker                        ## Start Fuseki test environment

create_vm:                                                 ## Create a basic virtual machine
	vagrant up vm-fuseki

install_docker:                                            ## Load the docker components
	vagrant ssh vm-fuseki -c "curl -sSL https://get.docker.com/ubuntu/ | sudo sh"

build:                                                     ## Build the docker image from the Dockerfile
	vagrant ssh vm-fuseki -c "sudo docker build -t brinxmat/fuseki-docker:latest /vagrant | tee -a build.log"

ui:                                                        ## Open UI
	vagrant ssh vm-fuseki -c "CID=IP=$(docker inspect $CID | grep IPAddress | cut -d '"' -f 4) | sudo apt-get install -y firefox && firefox http://127.0.0.1:3030"

load_docker:                                               ## Load the latest docker image
	vagrant ssh vm-fuseki -c "sudo nohup docker run -t -p 3030:3030 brinxmat/fuseki-docker:latest 2>&1 &"

run_fuseki: load_docker ui                                 ## Load docker image and open ui