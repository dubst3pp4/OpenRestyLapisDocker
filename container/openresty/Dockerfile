FROM openresty/openresty:1.13.6.2-xenial
RUN apt update && apt-get install -y --no-install-recommends libssl-dev && apt-get clean && rm -r /var/lib/apt/lists/*
RUN /usr/local/openresty/luajit/bin/luarocks install lapis
