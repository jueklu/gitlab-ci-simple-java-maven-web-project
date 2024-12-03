### Stage 1: Build Stage

# Use a lightweight JRE image as the base image / define as build stage
FROM maven:3.9.4-eclipse-temurin-17 AS builder

# Set the working directory inside the build stage
WORKDIR /app

# Copy the Maven project files into the container
COPY Maven-Web-App/pom.xml .
COPY Maven-Web-App/src ./src

# Run Maven to compile the project and package it as a WAR file
RUN mvn clean package



### Stage 2: Runtime Stage

# Use Apache Tomcat container
FROM tomcat:9.0.78-jdk17

# Create a non-root user and group
RUN groupadd -r tomcat && useradd -r -g tomcat tomcat

# Set the working directory inside the runtime stage
WORKDIR /usr/local/tomcat/webapps

# Copy the WAR file from the builder stage into the Tomcat webapps directory
COPY --from=builder /app/target/Maven-Web-App.war ./Maven-Web-App.war

# Set the appropriate permissions for the Tomcat user
RUN chown -R tomcat:tomcat /usr/local/tomcat

# Switch to the non-root user
USER tomcat

# Expose Tomcat's default port
EXPOSE 8080

# Start Tomcat when the container launches
ENTRYPOINT ["catalina.sh", "run"]
