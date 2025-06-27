ARG BUILD_FROM
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/sh", "-c"]

# Install Node.js and npm if not already present in base image
RUN if ! command -v node > /dev/null 2>&1; then \
        apk add --no-cache nodejs npm; \
    fi

# Create the node user and group with specific IDs
RUN addgroup -g 1000 node 2>/dev/null || true && \
    adduser -D -s /bin/sh -u 1000 -G node node 2>/dev/null || true

# Create necessary directories and set permissions
RUN mkdir -p /config/tmp /config/log /data/tmp /data/log /home/node/trilium-data && \
    chown -R 1000:1000 /config /data /home/node && \
    chmod -R 755 /config /data /home/node

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

# Home Assistant requires these labels
LABEL \
    io.hass.name="TriliumNext Notes" \
    io.hass.description="Hierarchical note-taking application" \
    io.hass.version="${BUILD_VERSION}" \
    io.hass.type="addon" \
    io.hass.arch="${BUILD_ARCH}"

# Expose the port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/ || exit 1

# Set entrypoint
ENTRYPOINT ["/run.sh"]
