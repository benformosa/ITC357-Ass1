#!/bin/bash
wget --http-user=tomcat --http-password=tomcat "http://localhost:8080/manager/text/undeploy?path=/hotel" -O -
jar -cvf hotel.war *
wget --http-user=tomcat --http-password=tomcat "http://localhost:8080/manager/text/deploy?war=file:/home/ben/uni/ITC357-Ass1/hotel.war&path=/hotel" -O -
