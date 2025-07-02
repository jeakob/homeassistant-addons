> [!NOTE]
> The Docker image has been relocated to . Please update your configuration accordingly.

> [!CAUTION]
> The Windows versions are not signed. If this is an issue, simply wait until we fix this issue.

> [!IMPORTANT]
> If you enjoyed this release, consider showing a token of appreciation by:
> 
> *   Pressing the “Star” button on [GitHub](https://github.com/TriliumNext/Trilium) (top-right).
> *   Considering a one-time or recurrent donation to the [lead developer](https://github.com/eliandoran) via [GitHub Sponsors](https://github.com/sponsors/eliandoran) or [PayPal](https://paypal.me/eliandoran).

## 💡 Key highlights

*   Thanks to a partnership with CKEditor, we now have a set of features that would otherwise be available on a commercial license only.
    *   Slash commands for easy commands via the keyboard.
    *   Text snippets to insert reusable pieces of text (similar to templates, but for blocks of text content).
    *   For more information, see the user guide → Note Types → Text → Premium features.

## 🐞 Bugfixes

*   [“Insert note after” long-press dialog doesn’t create Note](https://github.com/TriliumNext/Notes/issues/2246)
*   Code notes: user's font selection not respected.
*   [Windows V0.95.0 Client Failed to sync with server (use of double-slashes)](https://github.com/TriliumNext/Notes/issues/2339) by @perfectra1n
*   Desktop client not working on older Linux distros
*   [NOT NULL constraint failed: revisions.title when saving an empty note](https://github.com/TriliumNext/Trilium/issues/6103)

## ✨ Improvements

*   [Elixir language syntax highlighting for text notes](https://github.com/TriliumNext/Notes/pull/2327) (by @jshprentz) and code notes.
*   [Autocomplete: support specifying path when creating a new note](https://github.com/TriliumNext/Notes/pull/2342) by @SiriusXT
*   Markdown import: basic support for importing wikilinks
*   Text notes:
    *   Allow disabling emoji auto-completion from settings.
    *   Allow disabling note auto-completion from settings.
*   [Backend scripts: re-enable dayjs plugins by default](https://github.com/TriliumNext/Trilium/issues/6080)

## 📖 Documentation

*   [regex search / Nix flake / restore dev docs](https://github.com/TriliumNext/Notes/pull/2341) by @FliegendeWurst
*   New premium features in text note type.

## 🌍 Internationalization

*   Spanish improvements by @hasecilu

## 🛠️ Technical updates

*   flake: fix Electron version, fix Wayland support, fix source filter by @FliegendeWurst
*   Improvements to the landing page (under development) by @FliegendeWurst
*   Updated Node.js to v22.17.0
*   Updated CKEditor to v45.2.1
