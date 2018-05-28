FROM hypriot/rpi-java

RUN apt-get update && apt-get install -y \
    apt-utils \
    curl \
    unzip

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
