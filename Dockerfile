# Use the official Ubuntu base image
FROM ubuntu:latest

# Install Java
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for Java
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

# Download and install Apache Tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz && \
    tar xzvf apache-tomcat-9.0.73.tar.gz && \
    mv apache-tomcat-9.0.73 /usr/local/tomcat && \
    rm apache-tomcat-9.0.73.tar.gz

# Set environment variables for Tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

# Copy your Java application WAR file to the Tomcat webapps directory
COPY target/docker-java-app-example.jar $CATALINA_HOME/webapps/docker-java-app-example.jar

# Expose port 8080
EXPOSE 8080

# Start Tomcat in the foreground
CMD ["catalina.sh", "run"]
