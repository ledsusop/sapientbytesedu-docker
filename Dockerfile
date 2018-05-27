FROM docker pull raspbian/jessie

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["./entrypoint.sh"]
