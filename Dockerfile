FROM raspbian/jessie

RUN apt-get update && apt-get install -y curl unzip
RUN export JAVA_HOME="/usr/lib/jvm/jdk-8-oracle-arm32-vfp-hflt"
RUN export PATH=$PATH:$JAVA_HOME/bin

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["./entrypoint.sh"]
