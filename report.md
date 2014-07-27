---
title: ITC357-Assignment 1 Report
author: Ben Formosa 11429074
header-includes:
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyfoot[L]{Ben Formosa 11429074}
    - \fancyfoot[C]{\thepage}
---

# Build and Deploy #

I tested using Tomcat 7 on Ubuntu:

```
$ /usr/share/tomcat7/bin/version.sh
Using CATALINA_BASE:   /usr/share/tomcat7
Using CATALINA_HOME:   /usr/share/tomcat7
Using CATALINA_TMPDIR: /usr/share/tomcat7/temp
Using JRE_HOME:        /usr
Using CLASSPATH:       /usr/share/tomcat7/bin/bootstrap.jar:
                       /usr/share/tomcat7/bin/tomcat-juli.jar
Server version: Apache Tomcat/7.0.52 (Ubuntu)
Server built:   Feb 27 2014 12:18:34
Server number:  7.0.52.0
OS Name:        Linux
OS Version:     3.13.0-32-generic
Architecture:   amd64
JVM Version:    1.7.0_55-b14
JVM Vendor:     Oracle Corporation
```

I built and deployed using Tomcat Manager and this script:  

```bash
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
```

You could also build hotel.war and deploy to Tomcat via the admin gui.  
![Deploy to Tomcat Admin](image/deploy.png)

# Run #

Browse to the context path [http://localhost:8080/hotel/](http://localhost:8080/hotel/):  
![Registration form](image/hotel.png)

Fill in details:  
![Inputs](image/input.png)

I've used [jqueryui DatePicker](http://jqueryui.com/datepicker/) to make choosing dates easy:  
![Datepicker](image/datepick.png)

Click Submit

## Validation ##

All inputs blank:  
![Blank inputs](image/blank.png)

Adults or children out of accepted range:  
![Adults and children out of range](image/range.png)

Date input cannot be converted to a Date object:  
![Incorrect date format](image/date.png)

Arrival date is in the past:  
![Arrival date past](image/past.png)

Departure date is before arrival date:  
![Departure before arrival](image/future.png)

## Confirmation ##

All inputs validated, confirmation page shown:  
![Confirmation](image/confirm.png)

Clicking Edit will submit a hidden form back to the original page with all your details filled in.

Clicking Confirm will take you to a reservation finalised page:  
![Finalised](image/final.png)

Clicking Cancel on the confirmation page or New Reservation on the final page will take you back to the start with a blank form.

