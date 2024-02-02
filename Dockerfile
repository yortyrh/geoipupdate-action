FROM ghcr.io/maxmind/geoipupdate:latest
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
