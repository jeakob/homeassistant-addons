> [!NOTE]
> *TriliumNext Notes* will rebrand itself back to Trilium Notes since @zadam was kind enough to give us the original name. See [#2190](https://github.com/orgs/TriliumNext/discussions/2190) for more info. This will probably be the last version branded as *TriliumNext Notes*.

> [!IMPORTANT]
> If you enjoyed this release, consider showing a token of appreciation by:
> 
> *   Pressing the “Star” button on [GitHub](https://github.com/TriliumNext/Notes) (top-right).
> *   Considering a one-time or recurrent donation to the [lead developer](https://github.com/eliandoran) via [GitHub Sponsors](https://github.com/sponsors/eliandoran) or [PayPal](https://paypal.me/eliandoran).

## 🐞 Bugfixes

*   [error getting day node with ETAPI](https://github.com/TriliumNext/Notes/issues/2105)
*   server: unable to use web clipper due to communication error.
*   [Share page images stretched vertically](https://github.com/TriliumNext/Notes/issues/2124)
*   [External links using fragment navigation are wrongly recognized as internal links](https://github.com/TriliumNext/Notes/issues/2108) by @SiriusXT
*   [Selection invisible in non-Next themes](https://github.com/TriliumNext/Notes/issues/2099) by @SiriusXT
*   [llm: don't filter for specific words when pulling models for openai](https://github.com/TriliumNext/Notes/pull/2127) by @perfectra1n
*   [Sync errors with sync version 35 due to LLM embeddings](https://github.com/TriliumNext/Notes/issues/2119) by @perfectra1n
*   [Blank interface on startup](https://github.com/TriliumNext/Notes/issues/2103)
*   [Desktop application not working on Debian 12](https://github.com/TriliumNext/Notes/issues/2097)
*   [Share template falls back to default](https://github.com/TriliumNext/Notes/issues/2142)
*   [“Insert note after” long-press dialog doesn’t create Note](https://github.com/TriliumNext/Notes/issues/2128)
*   Blue dropdown selection color (when pressed).
*    not being respected if TOTP is enabled.
*   [Data loss when Note triggers automatic read-only threshold](https://github.com/TriliumNext/Notes/issues/1877) by @perfectra1n
*   [Unable to access Trilium server not running at root URL](https://github.com/TriliumNext/Notes/issues/2098)
*   [Short session expiry date when “Remember me” is not checked](https://github.com/TriliumNext/Notes/issues/2196)

## ✨ Improvements

*   geomap: the line of GPX traces now respects the  attribute.
*   Description for all keyboard shortcuts by @FliegendeWurst
*   Updated the themes for code notes to the latest version.
*   Share: pass  for translations for custom share templates & improve error logging for notes that could not be found.
*   On Docker we now publish  arch as well (functionally same as ), but for compatibility with different providers.
*   [Configurable date/time format for Alt+T shortcut](https://github.com/TriliumNext/Notes/pull/2083)
*   Bookmark improvements:
    *   [One-click navigation](https://github.com/TriliumNext/Notes/issues/2187)
    *   Display paragraph of the bookmark when hovering over a bookmark link
*   [LLM improvements](https://github.com/TriliumNext/Notes/pull/2181) by @perfectra1n
*   [Text notes: scroll to selection after undo/redo to keep cursor in view](https://github.com/TriliumNext/Notes/pull/2197) by @SiriusXT

## 📖 Documentation

*   Setting up a Graphana dashboard for Trilium by @perfectra1n
*   Improve documentation on day notes by @JYC333
*   Added some clarifications on session management (see _Authentication_ in the user guide)

## 🛠️ Technical updates

*   Library updates
*   Various dependency updates, including some security fixes.
*   We now have a functional Nix flake (thanks to @FliegendeWurst )
*   [LLM integration improvements](https://github.com/TriliumNext/Notes/pull/2110) by @perfectra1n
*   Updated Electron to 36.4.0.
