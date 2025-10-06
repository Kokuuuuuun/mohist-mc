FROM openjdk:17-jdk-slim

WORKDIR /server

# 1. Copiar configuraciones iniciales (sin mods/plugins para no pisar el volumen)
COPY server-files/eula.txt server-files/server.properties ./

# 2. Copiar mods y plugins que traigas en el repo
COPY mods/ ./mods/
COPY plugins/ ./plugins/

# 3. Descargar Mohist 1.20.1 (último build) -> se guardará en el volumen
ADD https://ci.codemc.io/job/MohistMC/job/Mohist-1.20.1/lastSuccessfulBuild/artifact/projects/mohist/build/libs/mohist-1.20.1-*-server.jar /server/mohist.jar

# 4. Puerto estándar
EXPOSE 25565

# 5. Arrancar
CMD ["java", "-Xms2G", "-Xmx12G", "-jar", "mohist.jar", "nogui"]