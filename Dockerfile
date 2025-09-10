# Gunakan Tomcat sebagai base image
FROM tomcat:10.1-jdk17

# Hapus default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR hasil build ke Tomcat
COPY target/BE-Passcheck-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
