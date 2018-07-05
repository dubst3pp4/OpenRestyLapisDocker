#!/bin/bash
export DUID="$(/usr/bin/id -u)"
export DGID="$(/usr/bin/id -g)"
docker-compose build
