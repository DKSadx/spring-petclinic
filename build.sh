#!/bin/sh

echo "--- Cloning git repository ---"
git clone https://github.com/DKSadx/spring-petclinic.git
cd spring-petclinic
git checkout test-branch

echo "--- Building spring app ---"
mvn package

echo "--- Copying .jar file ---"
cp /target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar /dockerfiles

echo "--- Building runtime image ---"
cd dockerfiles && docker build -t localhost:5000/spring -f DockerBuild .

echo "--- Pushing runtime image to local docker repository/hub ---"
docker push localhost:5000/spring 

