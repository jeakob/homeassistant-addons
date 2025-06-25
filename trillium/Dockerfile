ARG BUILD_FROM
ARG BUILD_VERSION=unknown

FROM ${BUILD_FROM}

# Use sh shell
SHELL ["/bin/sh", "-c"]

# Copy addon startup script and make executable
COPY run.sh /
RUN chmod a+x /run.sh

# Install socat and wget (needed for healthcheck)
RUN apk add --no-cache socat wget

# Home Assistant labels for metadata
LABEL \
    io.hass.name="TriliumNext Notes" \
    io.hass.description="Hierarchical note-taking application" \
    io.hass.version="${BUILD_VERSION}" \
    io.hass.type="addon" \
    io.hass.arch="${BUILD_ARCH}"

# Expose port 8080 (for raw access, if enabled)
EXPOSE 8080

# Healthcheck endpoint to verify app is running
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/ || exit 1

# Run your custom entrypoint script
ENTRYPOINT ["/run.sh"]
