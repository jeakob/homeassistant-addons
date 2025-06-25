#!/bin/sh
set -e

# Ensure data directory exists with proper permissions
mkdir -p /home/node/trilium-data
chown -R node:node /home/node/trilium-data
chmod -R 755 /home/node/trilium-data

echo "Starting TriliumNext Notes..."

APP_DIR="/usr/src/app"

# Important for Home Assistant Ingress
export TRILIUM_BASE_URL="/api/hassio_ingress/${HOSTNAME}"
export TRILIUM_ROOT_PATH="${TRILIUM_BASE_URL}"

cd "$APP_DIR"

# Read config option EXPOSE_RAW_PORT from Home Assistant addon config
EXPOSE_RAW_PORT=$(bashio::config 'EXPOSE_RAW_PORT')

if [ "$EXPOSE_RAW_PORT" = "true" ]; then
  echo "Starting Trilium with raw port exposed on 0.0.0.0:8080"
  exec su -s /bin/sh -c "node src/main --host 0.0.0.0 --port 8080" node
else
  echo "Starting Trilium bound only to localhost 127.0.0.1:8080 (ingress only)"
  exec su -s /bin/sh -c "node src/main --host 127.0.0.1 --port 8080" node
fi
