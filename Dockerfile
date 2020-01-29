FROM ubuntu:18.04

WORKDIR /spring-petclinic

COPY . /spring-petclinic

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get install -y maven

# RUN mvn /spring-petclinic/package

ENTRYPOINT ["java","-jar","target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar"]

EXPOSE 8080
