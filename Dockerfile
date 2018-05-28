FROM raspbian/jessie

RUN apt-get update && apt-get install -y \
    oracle-java8-jdk \
    apt-utils \
    curl \
    unzip

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
