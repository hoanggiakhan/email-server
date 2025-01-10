# Base image phù hợp
FROM maven:3.9.1-eclipse-temurin-17 AS build

# Sao chép file pom.xml và tải dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Sao chép mã nguồn và build ứng dụng
COPY . .
RUN mvn package

# Image chạy ứng dụng
FROM eclipse-temurin:17-jdk
COPY --from=build /path/to/your/app.jar /app.jar
CMD ["java", "-jar", "/app.jar"]
