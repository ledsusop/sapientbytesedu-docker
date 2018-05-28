FROM jsurf/rpi-java

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install -y \
    wget \
    apt-utils \
    curl \
    unzip

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]

RUN [ "cross-build-end" ]
