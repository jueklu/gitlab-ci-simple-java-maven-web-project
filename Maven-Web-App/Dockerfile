# Stage 1: Build the application using Maven
FROM maven:3.9.4-eclipse-temurin-17 AS builder

# Set working directory inside the container
WORKDIR /app

# Copy the pom.xml and source code into the container
COPY pom.xml .
COPY src ./src

# Run Maven to compile the project and package it as a WAR file
RUN mvn clean package


# Stage 2: Deploy the WAR file into a Tomcat container
FROM tomcat:9.0.78-jdk17

# Set working directory to Tomcat's webapps directory
WORKDIR /usr/local/tomcat/webapps

# Copy the WAR file from the builder stage into the Tomcat webapps directory
COPY --from=builder /app/target/Maven-Web-App.war ./Maven-Web-App.war

# Expose Tomcat's default port
EXPOSE 8080

# Start Tomcat when the container launches
CMD ["catalina.sh", "run"]
