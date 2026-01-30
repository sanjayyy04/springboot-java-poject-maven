# Use lightweight Java runtime
FROM eclipse-temurin:17-jre

# Set working directory inside container
WORKDIR /app

# Copy jar from target folder
COPY target/*.jar app.jar

# Expose application port
EXPOSE 8081

# Run the Spring Boot app
ENTRYPOINT ["java","-jar","/app/app.jar"]
