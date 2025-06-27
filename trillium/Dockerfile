ARG BUILD_FROM
FROM ${BUILD_FROM}
USER root
RUN mkdir -p /config/tmp /config/log && chown -R node:node /config/tmp /config/log
USER node
# Set shell
SHELL ["/bin/sh", "-c"]

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
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s \
  CMD wget --quiet --tries=1 --spider http://localhost:8080/ || exit 1

# Set entrypoint
ENTRYPOINT ["/run.sh"]
