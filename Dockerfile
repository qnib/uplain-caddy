FROM qnib/uplain-init

ENV SITE_ROOT=/usr/share/html/ \
    SITE_PORT=8080 \
    SITE_HOST=0.0.0.0
RUN apt-get update \
 && apt-get install -qq -y wget \
 && wget -qO - https://caddyserver.com/download/linux/amd64 |tar xfz - -C /usr/local/bin/
COPY html/index.html /usr/share/html/
COPY etc/caddy/config /etc/caddy/config
COPY bin/start.sh /opt/qnib/caddy/bin/
ENV ENTRY_USER=www-data
CMD ["/opt/qnib/caddy/bin/start.sh"]
