# Stage 1: Build the application
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:resolve 
COPY . .
RUN mvn clean package 

# Stage 2: Create the final runtime image
FROM openjdk:21-jre-slim 
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
EXPOSE 8081