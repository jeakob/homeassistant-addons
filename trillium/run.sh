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

# Create all necessary directories under /data (which maps to addon data)
mkdir -p /data/tmp /data/log /data/trilium-data

# Set ownership and permissions for /data
chown -R ${USER_UID}:${USER_GID} /data
chmod -R 755 /data

# Set environment variables to use /data for everything
export TRILIUM_DATA_DIR="/data/trilium-data"
export TMPDIR="/data/tmp"
export TEMP="/data/tmp"

# Debug: Show directory permissions
echo "Directory permissions for /data:"
ls -la /data

# Debug: Show Node user info
echo "Node user info:"
id node 2>/dev/null || echo "Node user not found"

# Show current user and process UID/GID
echo "Current user: $(whoami)"
echo "Process will run as UID: ${USER_UID}, GID: ${USER_GID}"

# Set OAuth environment variables from Home Assistant options
if [ -n "$OPTIONS_PATH" ] && [ -f "$OPTIONS_PATH" ]; then
    echo "Reading OAuth configuration from options..."
    
    # Read options from the JSON file
    OAUTH_BASE_URL=$(jq -r '.oauth_base_url // empty' "$OPTIONS_PATH")
    OAUTH_CLIENT_ID=$(jq -r '.oauth_client_id // empty' "$OPTIONS_PATH")
    OAUTH_CLIENT_SECRET=$(jq -r '.oauth_client_secret // empty' "$OPTIONS_PATH")
    OAUTH_ISSUER_BASE_URL=$(jq -r '.oauth_issuer_base_url // empty' "$OPTIONS_PATH")
    OAUTH_ISSUER_NAME=$(jq -r '.oauth_issuer_name // empty' "$OPTIONS_PATH")
    OAUTH_ISSUER_ICON=$(jq -r '.oauth_issuer_icon // empty' "$OPTIONS_PATH")
    
    # Export OAuth variables only if they have values
    [ -n "$OAUTH_BASE_URL" ] && export TRILIUM_OAUTH_BASE_URL="$OAUTH_BASE_URL"
    [ -n "$OAUTH_CLIENT_ID" ] && export TRILIUM_OAUTH_CLIENT_ID="$OAUTH_CLIENT_ID"
    [ -n "$OAUTH_CLIENT_SECRET" ] && export TRILIUM_OAUTH_CLIENT_SECRET="$OAUTH_CLIENT_SECRET"
    [ -n "$OAUTH_ISSUER_BASE_URL" ] && export TRILIUM_OAUTH_ISSUER_BASE_URL="$OAUTH_ISSUER_BASE_URL"
    [ -n "$OAUTH_ISSUER_NAME" ] && export TRILIUM_OAUTH_ISSUER_NAME="$OAUTH_ISSUER_NAME"
    [ -n "$OAUTH_ISSUER_ICON" ] && export TRILIUM_OAUTH_ISSUER_ICON="$OAUTH_ISSUER_ICON"
    
    # Debug: Show OAuth environment variables
    echo "OAuth configuration:"
    echo "TRILIUM_OAUTH_BASE_URL: '${TRILIUM_OAUTH_BASE_URL:-not set}'"
    echo "TRILIUM_OAUTH_CLIENT_ID: '${TRILIUM_OAUTH_CLIENT_ID:-not set}'"
    echo "TRILIUM_OAUTH_CLIENT_SECRET: '${TRILIUM_OAUTH_CLIENT_SECRET:-not set}'"
    echo "TRILIUM_OAUTH_ISSUER_BASE_URL: '${TRILIUM_OAUTH_ISSUER_BASE_URL:-not set}'"
    echo "TRILIUM_OAUTH_ISSUER_NAME: '${TRILIUM_OAUTH_ISSUER_NAME:-not set}'"
    echo "TRILIUM_OAUTH_ISSUER_ICON: '${TRILIUM_OAUTH_ISSUER_ICON:-not set}'"
else
    echo "No options file found, OAuth configuration skipped"
fi

echo "Starting TriliumNext Notes..."
echo "Web interface available at: http://$(hostname):8080"

# Important for Home Assistant Ingress
export TRILIUM_BASE_URL="/api/hassio_ingress/${HOSTNAME}"
export TRILIUM_ROOT_PATH="${TRILIUM_BASE_URL}"

# Change to app directory
APP_DIR="/usr/src/app"
cd "$APP_DIR"

echo "Starting TriliumNext Notes with ingress configuration..."
echo "Running as user: $(id ${USER_UID} 2>/dev/null || echo "UID ${USER_UID}")"

# Start the application as the node user
exec su -s /bin/sh node -c "node main.cjs --host 0.0.0.0 --port 8080"
