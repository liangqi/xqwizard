@echo off

rem set CLASSPATH=%CLASSPATH%;lib\catalina.jar
rem set CLASSPATH=%CLASSPATH%;lib\catalina-optional.jar
rem set CLASSPATH=%CLASSPATH%;lib\commons-el.jar
rem set CLASSPATH=%CLASSPATH%;lib\commons-logging.jar
rem set CLASSPATH=%CLASSPATH%;lib\commons-modeler.jar
rem set CLASSPATH=%CLASSPATH%;lib\naming-factory.jar
rem set CLASSPATH=%CLASSPATH%;lib\naming-resources.jar
rem set CLASSPATH=%CLASSPATH%;lib\servlet-api.jar
rem set CLASSPATH=%CLASSPATH%;lib\servlets-default.jar
rem set CLASSPATH=%CLASSPATH%;lib\tomcat-coyote.jar
rem set CLASSPATH=%CLASSPATH%;lib\tomcat-http.jar
rem set CLASSPATH=%CLASSPATH%;lib\tomcat-util.jar

set CLASSPATH=webapps\ROOT\WEB-INF\classes
set CLASSPATH=%CLASSPATH%;lib\jetty.jar
set CLASSPATH=%CLASSPATH%;lib\jetty-util.jar
set CLASSPATH=%CLASSPATH%;lib\servlet-api.jar
set CLASSPATH=%CLASSPATH%;webapps\ROOT\WEB-INF\lib\wicket.jar

start java -cp %CLASSPATH% Startup %1
pause
if "%1" == "" start http://localhost/
if not "%1" == "" start http://localhost:%1/

set CLASSPATH=