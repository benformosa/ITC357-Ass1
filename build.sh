#!/bin/bash
wget -q "http://tomcat:tomcat@localhost:8080/manager/text/undeploy?path=/hotel" -O -
jar -cf hotel.war *
wget -q "http://tomcat:tomcat@localhost:8080/manager/text/deploy?war=file:/home/ben/uni/ITC357-Ass1/hotel.war&path=/hotel" -O -
