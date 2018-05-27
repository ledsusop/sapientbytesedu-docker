FROM arm32v6/alpine

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["./entrypoint.sh"]
