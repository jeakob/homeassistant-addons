<img src="trill.png" width="100" height="100">

# TriliumNext Notes for Home Assistant

## About

TriliumNext Notes is a hierarchical note-taking application designed to build a personal knowledge base. It features Markdown support, encryption, synchronization, and more. This addon allows you to seamlessly integrate TriliumNext into your Home Assistant environment for easy access and management of your notes.

Key features of TriliumNext Notes:
- Hierarchical note-taking with multi-level structure
- Markdown and rich text support
- Secure encryption for sensitive data
- Cross-device synchronization
- Advanced search and tagging functionality
- In-app backups and restores

## Installation

Follow these steps to install the TriliumNext Notes addon on your Home Assistant:

1. **Add the repository to Home Assistant**:
   - Open Home Assistant, go to **Settings** → **Add-ons** → **Add-on Store**.
   - Click on the **three dots** in the top right corner and select **Repositories**.
   - Paste the following URL into the "Repository URL" field:
     ```(https://github.com/jeakob/homeassistant-addon)```
   - Click **Add**.

   [![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fjeakob%2Fhomeassistant-addons)

2. **Install the Addon**:
   - Go to the **Add-on Store**, search for **TriliumNext Notes**, and click **Install**.

3. **Start the Addon**:
   - Once installed, click **Start** to launch TriliumNext Notes.

## Initial Configuration

To access TriliumNext Notes:
- Use the Home Assistant **ingress** feature (through the Home Assistant UI or sidebar). Alternatively, browse directly to the addon using port **8080**.
- Create a user and set a secure password for accessing your notes.

## Configuration Options

You can customize the TriliumNext Notes addon with the following options:

| Option         | Description                                         | Default        |
|----------------|-----------------------------------------------------|----------------|
| `timezone`     | Timezone for the addon                              | `Europe/Berlin`|
| `log_level`    | Log level for the application (trace/debug/info/warning/error) | `info`         |
| `https_only`   | Force HTTPS connections only                       | `false`        |

## Data Storage

The TriliumNext Notes addon stores all data in the `/data/trilium-data` directory. This directory is mapped to your Home Assistant host, ensuring your data persists even if you uninstall or reinstall the addon. The data is stored in a persistent volume, so your notes will remain safe.

- **Location**: `/data/trilium-data` on the host
- **Path Mapping**: The addon will automatically use this path for storing notes, logs, and temporary files.

## Backup

To ensure the safety of your notes, it's recommended to create regular backups:

- **Home Assistant Backups**: You can create snapshots from **Settings** → **System** → **Backups**. These backups will include the addon data.
- **TriliumNext Backup**: You can also create manual backups directly from the TriliumNext Notes interface. To do this, go to **Options** → **Backup** within the app.

## Known Issues

### Incorrect URL Path in TriliumNext Notes Interface

During initial setup or in some dialogs, TriliumNext Notes may display an incorrect URL (e.g., using the Home Assistant host and port, instead of the ingress URL). This is normal behavior and does not impact the app's functionality. Use the Home Assistant UI to access the addon.

### Performance Issues on First Run

TriliumNext Notes may take some time to initialize on the first run, especially if it's being run on a slower machine. This is normal and should resolve after the initial setup.

## Troubleshooting

If you run into issues, here are some steps you can follow:

### Addon Won't Start
- Check the logs under **Settings** → **Add-ons** → **TriliumNext Notes** → **Logs** for any error messages.
- Ensure that required ports (e.g., 8080) aren't being used by other services.

### Web Interface Doesn't Load Completely
- Clear your browser cache and try again.
- Check the browser console for any JavaScript errors.
- Make sure your browser is up-to-date and compatible with the Home Assistant UI.

### Permissions Errors
- If you see permission-related errors (e.g., `EACCES` errors), ensure the `/data` directories have the correct permissions for the `node` user.
  - You can check directory permissions with the command:
    ```bash
    ls -la /data
    ```

## Support

If you encounter issues or have questions, please create a GitHub issue in the [TriliumNext Home Assistant Addon repository](https://github.com/jeakob/homeassistant-addons/trillium/issues).


