FROM centos:8
LABEL maintainer="michaelhans@sociallydetermined.com"

RUN yum update -y && \
    yum install -y unzip && \
    yum install -y java-11-openjdk.x86_64 && \
    yum clean all

RUN curl -O -L http://sourceforge.net/projects/geoserver/files/GeoServer/2.18.0/geoserver-2.18.0-bin.zip && \
    unzip geoserver-2.18.0-bin.zip -d /srv/geoserver && \
    rm geoserver-2.18.0-bin.zip

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-11.0.8.10-0.el8_2.x86_64

WORKDIR /srv/geoserver

EXPOSE 8080

CMD ["bin/startup.sh"]