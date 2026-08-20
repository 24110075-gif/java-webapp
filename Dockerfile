# Stage 1: Build the Maven WAR file
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Deploy WAR file to Tomcat 10 (Jakarta EE / Servlet API compatible)
FROM tomcat:10.1-jre17-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/web-app.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
