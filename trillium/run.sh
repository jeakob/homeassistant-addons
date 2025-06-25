#!/bin/bash
set -e

echo "Starting TriliumNext Notes..."

EXPOSE_RAW_PORT="${EXPOSE_RAW_PORT:-false}"

mkdir -p /home/node/trilium-data
chown -R node:node /home/node/trilium-data
chmod -R 755 /home/node/trilium-data

APP_DIR="/usr/src/app"
export TRILIUM_BASE_URL="/api/hassio_ingress/${HOSTNAME}"
export TRILIUM_ROOT_PATH="${TRILIUM_BASE_URL}"

cd "$APP_DIR"

if [ "$EXPOSE_RAW_PORT" = "true" ]; then
  echo "Starting Trilium with raw port exposed on 0.0.0.0:8080"
  exec su -s /bin/sh -c "node src/main --host 0.0.0.0 --port 8080" node
else
  echo "Starting Trilium bound only to localhost 127.0.0.1:8080 (ingress only)"
  exec su -s /bin/sh -c "node src/main --host 127.0.0.1 --port 8080" node
fi
