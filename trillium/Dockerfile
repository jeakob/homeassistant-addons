ARG BUILD_FROM
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/sh", "-c"]

# Install necessary tools
RUN apt-get update && apt-get install -y bash socat wget && rm -rf /var/lib/apt/lists/*

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh


# Copy addon startup script
COPY run.sh /
RUN chmod a+x /run.sh

# Home Assistant metadata
LABEL \
    io.hass.name="TriliumNext Notes" \
    io.hass.description="Hierarchical note-taking application" \
    io.hass.version="${BUILD_VERSION}" \
    io.hass.type="addon" \
    io.hass.arch="${BUILD_ARCH}"

# Expose the port
EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/ || exit 1

ENTRYPOINT ["/run.sh"]
