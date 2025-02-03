FROM amazoncorretto:8

# Set the working directory
WORKDIR /app

# Copy the project files
COPY . /app

# Grant execution permissions for Maven wrapper
RUN chmod +x mvnw

# Build the project
RUN ./mvnw package

# Expose the application port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]
