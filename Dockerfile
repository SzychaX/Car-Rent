# Etap 1: Build - budowanie aplikacji
FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etap 2: Runtime - uruchomienie gotowego JARa
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Kopiuj plik JAR z etapu build
COPY --from=build /app/target/*.jar app.jar

# Otwórz port (opcjonalnie)
EXPOSE 8081

# Komenda uruchamiająca aplikację
ENTRYPOINT ["java", "-jar", "app.jar"]
