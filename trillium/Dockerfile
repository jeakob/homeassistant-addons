# ARG to define the base image (make sure this is set when building)
ARG BUILD_FROM
FROM ${BUILD_FROM}

# Set the default shell to sh
SHELL ["/bin/sh", "-c"]

# Copy the run.sh script into the container's root directory
COPY run.sh /run.sh

# Make sure the run.sh script is executable
RUN chmod +x /run.sh

# Install Node.js and npm if they are not already present
RUN if ! command -v node > /dev/null 2>&1; then \
        apk add --no-cache nodejs npm; \
    fi

# Create the node user and group with specific IDs
RUN addgroup -g 1000 node 2>/dev/null || true && \
    adduser -D -s /bin/sh -u 1000 -G node node 2>/dev/null || true

# Create necessary directories and set appropriate permissions (focus on /data)
RUN mkdir -p /data/tmp /data/log /data/trilium-data && \
    chown -R 1000:1000 /data && \
    chmod -R 755 /data

# Declare the volume for persistent storage
VOLUME ["/data"]

# Home Assistant required labels
LABEL \
    io.hass.name="TriliumNext Notes" \
    io.hass.description="Hierarchical note-taking application" \
    io.hass.version="${BUILD_VERSION}" \
    io.hass.type="addon" \
    io.hass.arch="${BUILD_ARCH}"

# Expose port 8080 (this is for documentation; actual port exposure is handled by Home Assistant)
EXPOSE 8080

# Health check to ensure the service is running correctly
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/ || exit 1

# Set the entry point to the run.sh script
ENTRYPOINT ["/run.sh"]
