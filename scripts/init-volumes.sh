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

echo "=== Setup Completed Successfully ==="
