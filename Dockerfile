FROM ubuntu:latest

#WORKDIR /spring-petclinic

COPY . /spring-petclinic

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get install -y maven

# RUN mvn /spring-petclinic/package

CMD ["java","-jar","/spring-petclinic/target/*.jar"]

EXPOSE 8080
