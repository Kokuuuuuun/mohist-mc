FROM openjdk:17-jdk-slim

WORKDIR /server

# Copiar tu jar y configs iniciales
COPY server-files/ /server/

# Volumen para datos persistentes
VOLUME ["/server/world", "/server/config", "/server/mods", "/server/plugins"]

# Puerto estándar de Minecraft
EXPOSE 25264

CMD ["java", "-Xms2G", "-Xmx12G", "-jar", "mohist.jar", "nogui"]