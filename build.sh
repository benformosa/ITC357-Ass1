#!/bin/bash
rm hotel.war
rm -r WEB-INF/classes/*

base="http://tomcat:tomcat@localhost:8080/manager/text"
uri=$base"/undeploy?path=/hotel"
wget -q $uri -O -

javac -sourcepath src/ -d WEB-INF/classes \
  -classpath /usr/share/tomcat7/lib/servlet-api.jar src/*/*.java
jar -cf hotel.war *.jsp WEB-INF/ static/

uri=$base"/deploy?war=file:/home/ben/uni/ITC357-Ass1/hotel.war&path=/hotel"
wget -q $uri -O -
