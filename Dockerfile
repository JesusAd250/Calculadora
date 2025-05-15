# Etapa de construcción
FROM maven:3.9.6-eclipse-temurin-17-alpine AS build
WORKDIR /app

# Copiamos primero el pom para aprovechar la cache
COPY pom.xml .

# Descargamos dependencias
RUN mvn dependency:go-offline

# Ahora sí copiamos el resto del código
COPY src ./src

# Compilamos el proyecto (sin ejecutar tests)
RUN mvn clean package -DskipTests

# Etapa de ejecución
FROM eclipse-temurin:17-jdk-alpine 
VOLUME /tmp

# Copiamos el JAR generado
COPY --from=build /app/target/*.jar app.jar

# Comando de ejecución
ENTRYPOINT [ "java", "-jar", "/app.jar" ]
