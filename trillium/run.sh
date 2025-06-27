#!/bin/sh
set -e

echo "Setting up TriliumNext Notes..."

# Export environment variables that the Node.js app expects
export USER_UID=1000
export USER_GID=1000

# Ensure the node user exists with correct UID/GID
if ! id node >/dev/null 2>&1; then
    addgroup -g ${USER_GID} node 2>/dev/null || true
    adduser -D -s /bin/sh -u ${USER_UID} -G node node 2>/dev/null || true
fi

# Create all necessary directories with wide permissions first
mkdir -p /data/tmp /data/log /home/node/trilium-data
mkdir -p /config/tmp /config/log

# Set very permissive permissions to ensure Node.js can write
chmod -R 777 /config
chmod -R 777 /data
chown -R ${USER_UID}:${USER_GID} /data /home/node/trilium-data /config

# Debug: Show directory permissions
echo "Directory permissions:"
ls -la /config/
echo "Node user info:"
id node 2>/dev/null || echo "Node user not found"
echo "Current user: $(whoami)"
echo "Process will run as UID: ${USER_UID}, GID: ${USER_GID}"
echo "Starting TriliumNext Notes..."
echo "Web interface available at: http://$(hostname):8080"

# Use the known app path
APP_DIR="/usr/src/app"

# Important for Home Assistant Ingress
export TRILIUM_BASE_URL="/api/hassio_ingress/${HOSTNAME}"
export TRILIUM_ROOT_PATH="${TRILIUM_BASE_URL}"

# Change to app directory
cd "$APP_DIR"

echo "Starting TriliumNext Notes with ingress configuration..."
echo "Running as user: $(id ${USER_UID} 2>/dev/null || echo "UID ${USER_UID}")"

# Start the application as root (to avoid permission issues)
# The Node.js app will handle user switching internally
exec node src/main --host 0.0.0.0 --port 8080
