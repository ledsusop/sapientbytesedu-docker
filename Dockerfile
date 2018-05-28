FROM raspbian/jessie

ENV JAVA_HOME="/usr/lib/jvm/jdk-8-oracle-arm32-vfp-hflt"
ENV PATH="${PATH}:${JAVA_HOME}/bin"

RUN apt-get update && apt-get install -y \
    curl \
    unzip

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
