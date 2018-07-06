FROM openresty/openresty:1.13.6.2-xenial
ARG DUID
ARG DGID
RUN apt update && apt-get install -y --no-install-recommends libssl-dev && apt-get clean && rm -r /var/lib/apt/lists/*
RUN /usr/local/openresty/luajit/bin/luarocks install lapis
RUN groupadd -g $DGID nginx && useradd -u $DUID -d /var/cache/nginx -s /sbin/nologin -g nginx nginx 
COPY entrypoint.sh /entrypoint.sh
RUN chmod 0755 /entrypoint.sh 
WORKDIR /app
ENV LAPIS_TYPE=lua
ENTRYPOINT ["/entrypoint.sh"]
CMD ["lapis", "server"]
