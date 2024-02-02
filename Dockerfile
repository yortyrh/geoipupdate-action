FROM ghcr.io/maxmind/geoipupdate:latest
COPY entrypoint.sh /entrypoint.sh
ENV GEOIPUPDATE_DB_DIR=.
ENTRYPOINT ["/entrypoint.sh"]
