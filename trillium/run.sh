#!/bin/bash
set -e

echo "Starting TriliumNext Notes setup..."

# Ensure data directory exists with proper permissions
mkdir -p /home/trilium/trilium-data
chown -R trilium:trilium /home/trilium/trilium-data
chmod -R 755 /home/trilium/trilium-data

# Set up environment variables
export TRILIUM_DATA_DIR="/home/trilium/trilium-data"
export NODE_ENV="production"
export HOST="0.0.0.0"
export PORT="8080"

# Home Assistant Ingress configuration
if [ -n "$HOSTNAME" ]; then
    export TRILIUM_BASE_URL="/api/hassio_ingress/${HOSTNAME}"
    export TRILIUM_ROOT_PATH="${TRILIUM_BASE_URL}"
fi

echo "Data directory: $TRILIUM_DATA_DIR"
echo "Starting TriliumNext Notes..."
echo "Web interface will be available via Home Assistant Ingress"

# Start the application as trilium user
exec su -s /bin/bash -c "cd /usr/src/app && exec node main.cjs" trilium
