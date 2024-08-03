# Use the OpenJDK 8 Alpine base image
FROM openjdk:8-jdk-alpine

# Install necessary packages
RUN apk --no-cache add wget tar

# Download and install Apache Tomcat 9.0.91
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.tar.gz  && \
    tar xzvf apache-tomcat-9.0.91.tar.gz && \
    mv apache-tomcat-9.0.91 /usr/local/tomcat && \
    rm apache-tomcat-9.0.91.tar.gz

# Set environment variables for Tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Copy your Java application JAR file to the Tomcat webapps directory
COPY target/docker-java-app-example.jar $CATALINA_HOME/webapps/docker-java-app-example.jar

# Expose port 8080
EXPOSE 8080

# Start Tomcat in the foreground
CMD ["catalina.sh", "run"]
