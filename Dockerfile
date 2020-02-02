FROM ubuntu:18.04 AS build

WORKDIR /spring-petclinic

COPY pom.xml pom.xml

RUN apt-get update && \
apt-get install -y maven

RUN mvn -B dependency:resolve-plugins dependency:resolve

COPY . /spring-petclinic

RUN mvn package


FROM ubuntu:18.04

WORKDIR /spring-petclinic

RUN apt-get update && \
apt-get install -y openjdk-8-jdk iputils-ping

COPY --from=build /spring-petclinic/target target

COPY spring_docker.sh .

RUN chmod +x spring_docker.sh

ENTRYPOINT ["./spring_docker.sh"]

EXPOSE 8080
