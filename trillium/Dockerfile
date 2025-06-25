ARG BUILD_FROM
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install dependencies
RUN apk add --no-cache \
    nodejs \
    npm \
    wget \
    curl

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

# Create trilium user and data directory
RUN addgroup -g 1000 trilium && \
    adduser -D -s /bin/bash -u 1000 -G trilium trilium && \
    mkdir -p /home/trilium/trilium-data && \
    chown -R trilium:trilium /home/trilium

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
