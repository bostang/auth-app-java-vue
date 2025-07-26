# Multi-stage build untuk Secure Onboarding
# Stage 1: Build stage
FROM maven:3.9.8-eclipse-temurin-21 AS build
WORKDIR /app

# Copy pom.xml dan download dependencies
COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn
RUN ./mvnw dependency:go-offline

# Copy source code
COPY src ./src

# Build aplikasi
RUN ./mvnw clean package -DskipTests

# Stage 2: Runtime stage
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copy JAR dari build stage
COPY --from=build /app/target/*.jar app.jar

# Copy .env file ke runtime (jika ada)
COPY --from=build /app/.env* ./

# # inject environment variables from .env.production file
# ENV $(cat .env.production | xargs)
## AKAN DI-INJECT DARI DOCKER-COMPOSE


# Expose port
EXPOSE 8081

# Run aplikasi dengan nama JAR yang fixed
CMD ["java", "-jar", "app.jar"]