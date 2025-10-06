FROM openjdk:17-jdk-slim

WORKDIR /server

# 1. Configs iniciales
COPY server-files/eula.txt server-files/server.properties ./

# 2. Tu mohist.jar (desde el repo / LFS)
COPY server-files/mohist.jar ./mohist.jar

# 3. Mods y plugins que traigas
COPY mods/ ./mods/
COPY plugins/ ./plugins/

EXPOSE 25264

CMD ["java", "-Xms2G", "-Xmx12G", "-jar", "mohist.jar", "nogui"]