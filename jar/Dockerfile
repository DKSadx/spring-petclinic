FROM openjdk:8-jdk-alpine

COPY . .

CMD ["java", "-jar", "-Dspring.profiles.active=mysql", "spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar"]

EXPOSE 8080