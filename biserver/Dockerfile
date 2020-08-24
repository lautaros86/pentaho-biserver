FROM java:8
LABEL maintainer="dgraselli@gmail.ar"

# Init ENV
ENV BISERVER_VERSION 9.0
ENV BISERVER_TAG 9.0.0.0-423
ENV PENTAHO_HOME /pentaho

# Apply JAVA_HOME
RUN . /etc/environment
ENV PENTAHO_JAVA_HOME $JAVA_HOME
ENV PENTAHO_JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-amd64

# Install Dependences
RUN apt-get update; apt-get install zip netcat -y; \
    apt-get install wget unzip vim -y; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;

RUN mkdir ${PENTAHO_HOME}; useradd -s /bin/bash -d ${PENTAHO_HOME} pentaho; chown pentaho:pentaho ${PENTAHO_HOME}
WORKDIR ${PENTAHO_HOME}

# Download Pentaho BI Server
RUN wget --progress=dot:giga https://sourceforge.net/projects/pentaho/files/Pentaho%20${BISERVER_VERSION}/server/pentaho-server-ce-${BISERVER_TAG}.zip 
RUN unzip -q *.zip -d ${PENTAHO_HOME} 
RUN rm -f *.zip 
RUN rm ${PENTAHO_HOME}/pentaho-server/promptuser.sh

COPY saiku $PENTAHO_HOME/pentaho-server/pentaho-solutions/system/saiku
COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

USER pentaho

EXPOSE 8080 
ENTRYPOINT [ "/docker-entrypoint.sh" ]