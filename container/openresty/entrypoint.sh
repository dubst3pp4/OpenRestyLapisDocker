#!/usr/bin/env bash
CMD="$@"
APP=/app
cd $APP/
if [ ! -f $APP/nginx.conf ]; then
    echo "creating initial lapis project..."
    lapis new `if [ ! -z $LAPIS_TYPE ]; then echo "--$LAPIS_TYPE"; fi`
    if [ $? -ne 0 ]; then
        echo "error creating project"
        exit 1
    fi
    echo "done."
fi
chown -R nginx:nginx $APP
echo "starting application..."
exec su nginx -s /bin/bash -c "export PATH=$PATH && $CMD"
