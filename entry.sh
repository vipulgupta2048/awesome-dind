#!/bin/bash

rm -rf /var/run/docker 2>/dev/null || true
rm -f /var/run/docker.sock 2>/dev/null || true
rm -f /var/run/docker.pid 2>/dev/null || true

dockerd &

# This is a placeholder command to keepalive the container. Replace it with the following options as per your usecase. 
# 1. Perform actions with docker in the background
# 2. Run docker in foreground so signals can be passed properly & allow for clean shutdown
tail -f /dev/null