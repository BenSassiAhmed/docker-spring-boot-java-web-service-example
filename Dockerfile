# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jre-alpine

RUN apk update && apk add bash

WORKDIR /app

# Copy the  jar into the container at /app
COPY /target/docker-java-app-example.jar /app

EXPOSE 8080

# Run jar file when the container launches
CMD ["java", "-jar", "docker-java-app-example.jar"]
