#FROM ubuntu:18.04 AS build

FROM maven AS build

WORKDIR /spring-petclinic

COPY pom.xml pom.xml

#RUN apt-get update && \
#apt-get install -y maven

RUN mvn -B dependency:resolve-plugins dependency:resolve

COPY . /spring-petclinic

RUN mvn package


#FROM ubuntu:18.04

FROM openjdk:8-jdk-alpine

WORKDIR /spring-petclinic

#RUN apt-get update && \
#apt-get install -y openjdk-8-jdk

COPY --from=build /spring-petclinic/target target

ENTRYPOINT ["java","-jar","-Dspring.profiles.active=mysql","target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar"]

EXPOSE 8080
