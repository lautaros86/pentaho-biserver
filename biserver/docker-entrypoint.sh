#!/bin/sh

DIR="$PENTAHO_HOME"/pentaho-server/
DI_HOME="$DIR"/pentaho-solutions/system/kettle
cd "$DIR/tomcat/bin"
CATALINA_OPTS="-Xms2048m -Xmx6144m -XX:MaxPermSize=256m -Dsun.rmi.dgc.client.gcInterval=3600000 -Dsun.rmi.dgc.server.gcInterval=3600000 -Dfile.encoding=utf8 -DDI_HOME=\"$DI_HOME\""
export CATALINA_OPTS
#JAVA_HOME=$_PENTAHO_JAVA_HOME
#exec sh "$DIR/tomcat/bin"/catalina.sh run
exec ./catalina.sh run