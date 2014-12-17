FROM debian:jessie

MAINTAINER Rurik Thomas Greenall <rurik.greenall@computas.com>

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y tar locales wget curl openjdk-7-jre-headless

RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

RUN mkdir /opt/fuseki

ADD http://apache.mirror.anlx.net/jena/binaries/jena-fuseki-1.1.1-distribution.tar.gz /opt/fuseki/jena-fuseki-1.1.1-distribution.tar.gz
RUN tar -xvzf /opt/fuseki/jena-fuseki-1.1.1-distribution.tar.gz -C /opt/fuseki
RUN chmod +x /opt/fuseki/jena-fuseki-1.1.1/fuseki-server
ADD config.ttl /opt/fuseki/jena-fuseki-1.1.1/user_config.ttl
ADD startup.sh /opt/fuseki/jena-fuseki-1.1.1/startup.sh
RUN chmod +x /opt/fuseki/jena-fuseki-1.1.1/startup.sh
RUN mkdir /data
VOLUME /data
EXPOSE 3030
CMD ["/opt/fuseki/jena-fuseki-1.1.1/startup.sh"]