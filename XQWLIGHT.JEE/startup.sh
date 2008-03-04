#!/bin/sh

#CLASSPATH=$CLASSPATH:lib/catalina.jar
#CLASSPATH=$CLASSPATH:lib/catalina-optional.jar
#CLASSPATH=$CLASSPATH:lib/commons-el.jar
#CLASSPATH=$CLASSPATH:lib/commons-logging.jar
#CLASSPATH=$CLASSPATH:lib/commons-modeler.jar
#CLASSPATH=$CLASSPATH:lib/naming-factory.jar
#CLASSPATH=$CLASSPATH:lib/naming-resources.jar
#CLASSPATH=$CLASSPATH:lib/servlet-api.jar
#CLASSPATH=$CLASSPATH:lib/servlets-default.jar
#CLASSPATH=$CLASSPATH:lib/tomcat-coyote.jar
#CLASSPATH=$CLASSPATH:lib/tomcat-http.jar
#CLASSPATH=$CLASSPATH:lib/tomcat-util.jar

CLASSPATH=webapps/ROOT/WEB-INF/classes
CLASSPATH=$CLASSPATH:lib/jetty-util.jar
CLASSPATH=$CLASSPATH:lib/jetty.jar
CLASSPATH=$CLASSPATH:lib/servlet-api.jar
CLASSPATH=$CLASSPATH:webapps/ROOT/WEB-INF/lib/wicket.jar

java -cp $CLASSPATH Startup $1 &

CLASSPATH=