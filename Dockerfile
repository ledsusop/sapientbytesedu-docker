FROM sapientbytes/sapientbytes-maven-docker

RUN [ "cross-build-start" ]

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]

RUN [ "cross-build-end" ]
