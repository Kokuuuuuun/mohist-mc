FROM openjdk:17-jdk-slim
WORKDIR /server

# 1. Configs livianos
COPY server-files/eula.txt server-files/server.properties ./

# 2. Descargar Mohist desde tu subdominio
# ADD https://storage.theoasiss.us/storage/v1/object/public/minecraft-files/mohist.jar /server/mohist.jar

# 3. Descargar y descomprimir mods en /tmp
# ADD https://storage.theoasiss.us/storage/v1/object/public/minecraft-files/mods.zip /tmp/mods.zip
# RUN unzip -q /tmp/mods.zip -d /tmp && \
#   mkdir -p /server/mods && \
#    find /tmp -name "*.jar" -exec mv {} /server/mods/ \; && \
#    rm -rf /tmp/mods.zip /tmp/mods 2>/dev/null || true

# (Opcional) mismo truco para plugins
# ADD https://storage.theoasiss.us/storage/v1/object/public/minecraft-files/plugins.zip /tmp/plugins.zip
# RUN unzip -q /tmp/plugins.zip -d /tmp && \
#     mkdir -p /server/plugins && \
#     find /tmp -name "*.jar" -exec mv {} /server/plugins/ \; && \
#     rm -rf /tmp/plugins.zip /tmp/plugins 2>/dev/null || true

EXPOSE 25565
CMD ["java", "-Xms2G", "-Xmx10G", "-jar", "mohist.jar", "nogui"]