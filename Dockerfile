# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jre-alpine

# set shell to bash
RUN apk update && apk add bash

# Set the working directory to /app
WORKDIR /app

# Copy the  jar into the container at /app
COPY /target/docker-java-app-example.jar /app

# Make port 8085 available to the world outside this container
EXPOSE 8085

# Run jar file when the container launches
CMD ["java", "-jar", "docker-java-app-example.jar"]
