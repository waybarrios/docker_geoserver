#jdk pre installed
FROM tomcat:8 
MAINTAINER Wayner Barrios <waybarrios@gmail.com>

#
# Set GeoServer version and data directory 
#

ENV GEOSERVER_VERSION=2.9.x \
    GEOSERVER_DATA_DIR="/geoserver_data"

#
# Download and install GeoServer
#

RUN cd /usr/local/tomcat/webapps \
    && wget --progress=bar:force:noscroll http://build.geonode.org/geoserver/latest/geoserver-$GEOSERVER_VERSION.war \
    && mv geoserver-$GEOSERVER_VERSION.war geoserver.war \
    && mkdir $GEOSERVER_DATA_DIR

#useful for import data into this folder 
VOLUME $GEOSERVER_DATA_DIR

