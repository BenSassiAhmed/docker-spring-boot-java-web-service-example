# Use the OpenJDK 8 Alpine base image
FROM openjdk:8-jdk-alpine

# Install necessary packages
RUN apk --no-cache add wget tar

# Download and install Apache Tomcat 8.5.73
RUN wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.73/bin/apache-tomcat-8.5.73.tar.gz && \
    tar xzvf apache-tomcat-8.5.73.tar.gz && \
    mv apache-tomcat-8.5.73 /usr/local/tomcat && \
    rm apache-tomcat-8.5.73.tar.gz

# Set environment variables for Tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Copy your Java application JAR file to the Tomcat webapps directory
COPY target/docker-java-app-example.jar $CATALINA_HOME/webapps/docker-java-app-example.jar

# Expose port 8080
EXPOSE 8080

# Start Tomcat in the foreground
CMD ["catalina.sh", "run"]
