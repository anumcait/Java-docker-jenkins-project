# Use official Tomcat base image with JDK 17
FROM tomcat:9.0-jdk17-temurin

# Remove default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into Tomcat as ROOT application
COPY target/myapp.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat default port (8080 inside container)
EXPOSE 8080

# Start Tomcat in foreground
CMD ["catalina.sh", "run"]
