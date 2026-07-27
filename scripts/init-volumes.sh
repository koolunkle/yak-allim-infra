#!/usr/bin/env bash

echo "=== Initializing Yak-Allim Shared Infrastructure Networks and Volumes ==="

# Create docker bridge network if not exists
if ! docker network inspect app-network >/dev/null 2>&1; then
    echo "Creating docker network: app-network"
    docker network create app-network
else
    echo "Docker network 'app-network' already exists."
fi

# Create named volume for Jenkins Home
if ! docker volume inspect jenkins_home >/dev/null 2>&1; then
    echo "Creating docker volume: jenkins_home"
    docker volume create jenkins_home
else
    echo "Docker volume 'jenkins_home' already exists."
fi

# Ensure initial service-url.inc file exists in nginx/conf.d
if [ ! -f "nginx/conf.d/service-url.inc" ]; then
    echo "Creating default nginx/conf.d/service-url.inc..."
    mkdir -p nginx/conf.d
    echo 'set $service_url http://yak-allim-backend-blue:8081;' > nginx/conf.d/service-url.inc
fi

echo "=== Setup Completed Successfully ==="
