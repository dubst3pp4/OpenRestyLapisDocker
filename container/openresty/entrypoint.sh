#!/usr/bin/env bash
APP=/app
# check if installation in /app exists
cd $APP/
if [ ! -f $APP/nginx.conf ]; then
    echo "creating initial lapis project..."
    lapis new --lua
    echo "done"
fi
echo "starting application..."
exec "$@"
