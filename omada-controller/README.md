# Home Assistant Omada Add-On

![CI](https://github.com/jkunczik/home-assistant-omada/workflows/Build%20and%20Push%20Multi-Platform%20Docker%20Image/badge.svg)

This add-on integrates the Omada Controller directly into Home Assistant, supporting both 64-bit ARM and x64 processors.

## Add-On Versions

- **Omada Stable**: Built from the Omada Beta once updated to the latest stable upstream version.
- **Omada Beta**: Generally stable and based on the well-tested
  [docker-omada-controller](https://github.com/mbentley/docker-omada-controller),
but might contain minor Home Assistant-related inconsistencies or bugs.

## Installation

To install this third-party add-on:

1. Open **Home Assistant** > **Settings** > **Add-ons** > **Add-on Store**.
2. Click the menu (three dots in the top-right corner) and select **Repositories**.
3. Paste the GitHub repository link into the field at the bottom:  
   `https://github.com/jkunczik/home-assistant-omada`.
4. Refresh the page if needed. The add-on will appear under **Home Assistant Omada**.

## Configuration Options

To use a custom SSL certificate configured for Home Assistant:

1. Enable **Enable Home Assistant SSL** in the add-on configuration.
2. Provide the full paths to the:
   1. **Certificate file**
   2. **Private key**
3. The default paths are compatible with the `LetsEncrypt` add-on.

## Cloudflare Tunnel

If you are using a domain with Cloudflare for DNS,
you can expose your local Home Assistant instance through a Cloudflare Tunnel.
This eliminates the need to open a port on your local network or configure custom certificates.
Cloudflare handles TLS, making this a safer and more streamlined solution.

This [add-on](https://github.com/brenner-tobias/addon-cloudflared)
simplifies the integration of the tunnel into Home Assistant.
Additionally, Omada can be easily added as a secondary host alongside Home Assistant.

Follow the documentation to configure Omada under `Additional Hosts` as follows:

```yaml
- hostname: {MY_HOME_ASSISTANT_DOMAIN}
  service: https://{YOUR_LOCAL_HOME_ASSISTANT_IP}:8043
```

## Developing

For local development, use the `Omada Dev` variant.
This is where the source code resides and where changes can be made.
Follow the steps below to build and test a new Docker image:

### Build the Docker Image Locally

Set the desired version and build the image:

```bash
# INSTALL_VER should match the version in the config.yaml
INSTALL_VER="5.14.32.4"
docker build . -t omada_stable --build-arg "INSTALL_VER=$INSTALL_VER"
```

### Run the Docker Container Locally

```bash
docker run --rm -p 8043:8043 -v vol_omada_stable:/data omada_stable
```

Refer to the
[Home Assistant Add-On Testing Documentation](https://developers.home-assistant.io/docs/add-ons/testing)
for more details and best practices.

### Releasing a New Version

1. Update the `mbentley` submodule to the latest `master` branch.
2. Update the version in `config.yaml` for either `beta` or `stable`.
   Ensure the version matches one listed in
   [this script](https://github.com/mbentley/docker-omada-controller-url/blob/master/omada_ver_to_url.sh).
   If it is needed to make a new add-on release for the same Omada version,
   a `-ha{d}` suffix can be added to the Omada version.
3. Thoroughly test the changes in a local environment.
   Once the tests pass and you're satisfied, create a pull request (PR) with the updates.
4. The pipeline will build docker images for every branch,
   but only push the images to the registry on `master`.

## Contribution

This add-on wraps Matt Bentley’s
[docker-omada-controller](https://github.com/mbentley/docker-omada-controller),
which is included as a Git submodule.
Special thanks to DraTrav and contributors for advancing this project.
This add-on was made possible thanks to their outstanding work.

Key differences from the original:

- Persistent data is stored in the `/data` directory, making it compatible with Home Assistant.

Contributions are welcome! Feel free to submit pull requests for version updates, bug fixes, or new features.

<a href="https://github.com/jkunczik/home-assistant-omada/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=jkunczik/home-assistant-omada" />
</a>

Made with [contrib.rocks](https://contrib.rocks).
