fuseki-docker: Dockerized Jena Fuseki
=====================================

Cloning this repo will provide you with a simple RDF workbench based on Jena Fuseki.

##Quickstart

1. Install vagrant
2. Clone repo
3. From the cloned folder, enter the following commands on the command line:
```
term$ make up_fuseki
term$ make build
term$ make run_fuseki
```

##Install Vagrant

Install the correct version of vagrant via your package manager (hint: brew on a Mac), or by visiting https://www.vagrantup.com/downloads. You might want to install vagrant cachier at the same time (https://github.com/fgrehm/vagrant-cachier) as this removes some of the waiting pain.

##Install make
For Windows users, you need the make command-line tool. You can probably get away with Gow (https://github.com/bmatzelle/gow). If you're on a Mac, you might need to install the OS X command line tools. Linux will likely be good to go.

##Clone repo

Clone https://github.com/brinxmat/fuseki-docker.git

##Make the project

Make the vagrant enviroment
```
term$ make up_fuseki
```
Build the fuseki docker image
```
term$ make build
```
Run fuseki and open a web browser
```
term$ make run_fuseki
```
##Using Fuseki

Click [Control panel], then select the /ds dataset and you're good to go.

###Loading data

If you have data you want to load into the triplestore, just put this into the directory you cloned your project into. It will be available in /vagrant
