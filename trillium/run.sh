#!/bin/sh
set -e

# Ensure data directory exists with proper permissions
mkdir -p /home/node/trilium-data
chown -R node:node /home/node/trilium-data
chmod -R 755 /home/node/trilium-data

echo "Starting TriliumNext Notes..."
echo "Web interface available at: http://$(hostname):8080"

# Application directory
APP_DIR="/usr/src/app"

# Home Assistant Ingress path
export TRILIUM_BASE_URL="/api/hassio_ingress/${HOSTNAME}"
export TRILIUM_ROOT_PATH="${TRILIUM_BASE_URL}"

# Optional debug logs (disable in production)
echo "TRILIUM_OAUTH_BASE_URL: $TRILIUM_OAUTH_BASE_URL"
echo "TRILIUM_OAUTH_CLIENT_ID: $TRILIUM_OAUTH_CLIENT_ID"
echo "TRILIUM_OAUTH_ISSUER_BASE_URL: $TRILIUM_OAUTH_ISSUER_BASE_URL"
echo "TRILIUM_OAUTH_ISSUER_NAME: $TRILIUM_OAUTH_ISSUER_NAME"

# Move to application directory
cd "$APP_DIR"

# Start Trilium as the node user with environment variables preserved
echo "Starting TriliumNext Notes with ingress and OIDC configuration..."
exec su -s /bin/sh node -c 'env node src/main --host 0.0.0.0 --port 8080'
