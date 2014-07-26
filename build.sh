#!/bin/bash
rm hotel.war
rm -r WEB-INF/classes/*
wget -q "http://tomcat:tomcat@localhost:8080/manager/text/undeploy?path=/hotel" -O -

javac -sourcepath src/ -d WEB-INF/classes -classpath /usr/share/tomcat7/lib/servlet-api.jar src/hotel/*.java
jar -cf hotel.war *.jsp WEB-INF/ css/ js/

wget -q "http://tomcat:tomcat@localhost:8080/manager/text/deploy?war=file:/home/ben/uni/ITC357-Ass1/hotel.war&path=/hotel" -O -
