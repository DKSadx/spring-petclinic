#!/bin/sh

# Replaces localhost ip with the mySql container ip
echo "$(ping -c1 mysql | grep -oh '\(172.*\)' | cut -d")" -f1 | head -1) localhost" >> /etc/hosts

# Runs the app
java -jar -Dspring.profiles.active=mysql target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar

