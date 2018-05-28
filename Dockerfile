FROM raspbian/jessie

RUN apt-get update && apt-get install -y \
    curl \
    unzip

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
