#!/bin/sh
set -e

echo "Setting up TriliumNext Notes..."

# Set default user/group if not specified
USER_UID=${USER_UID:-1000}
USER_GID=${USER_GID:-1000}

# Ensure the node user exists with correct UID/GID
if ! id node >/dev/null 2>&1; then
    addgroup -g ${USER_GID} node 2>/dev/null || true
    adduser -D -s /bin/sh -u ${USER_UID} -G node node 2>/dev/null || true
fi

# Create necessary directories
mkdir -p /data/tmp /data/log /home/node/trilium-data /config

# Remove any existing symlinks and recreate them
rm -rf /config/tmp /config/log 2>/dev/null || true
ln -sf /data/tmp /config/tmp
ln -sf /data/log /config/log

# Set ownership and permissions for all directories
chown -R ${USER_UID}:${USER_GID} /data /home/node/trilium-data /config
chmod -R 755 /data /home/node/trilium-data /config

echo "Directory setup complete"
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

# Start the application as the node user
exec su-exec ${USER_UID}:${USER_GID} node src/main --host 0.0.0.0 --port 8080
