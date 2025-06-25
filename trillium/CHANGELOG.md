# Changelog for TriliumNext Notes v0.95.0

> [!IMPORTANT]
> If you enjoyed this release, consider showing a token of appreciation by:
> 
> *   Pressing the “Star” button on [GitHub](https://github.com/TriliumNext/Notes) (top-right).
> *   Considering a one-time or recurrent donation to the [lead developer](https://github.com/eliandoran) via [GitHub Sponsors](https://github.com/sponsors/eliandoran) or [PayPal](https://paypal.me/eliandoran).

> [!CAUTION]
> Sync version has been increased, so update of both the client and server are necessary.

> [!IMPORTANT]
> For canvas notes, the “Mermaid to Excalidraw” feature is no longer functional for now since it relies on an old version of Mermaid diagrams. To avoid having a large library duplicated, we had to let go of this feature. If it's an important feature to you, let us know.

## 💡 Key highlights

*   Improvements to the shared notes functionality:
    *   A new default theme was introduced called Trilium.Rocks (original development by @zerebos) and adapted to our project. New features from this theme include: search, collapsible tree, light/dark mode, mobile mobile.
    *   Basic syntax highlighting for code blocks has been added, but only if the language is explicitly specified.
    *   Note icons are now displayed in the share tree.
    *   Math equations are now rendered in text notes.

## 🐞 Bugfixes

*   Text notes stability if the editor crashes:
    *   Data loss if the editor crashed while it was saving (causing an empty note)
    *   Blank screen if editor crashes more than once
*   [Zen Mode: text formatting commands are missing from UI](https://github.com/TriliumNext/Notes/issues/1370) by @SiriusXT
*   [Links: Unable to open notes in a new window](https://github.com/TriliumNext/Notes/pull/2243) by @SiriusXT
*   [desktop syncing issues with the app](https://github.com/TriliumNext/Notes/issues/2268)
*   LLM bugfixes by @perfectra1n:
    *   LLM could sometimes save the response in the wrong note
    *   [Llama3.1 doesn't work](https://github.com/TriliumNext/Notes/issues/2200)
*   Text notes:
    *   [Selection gets incomplete when moving multiple lines up/down](https://github.com/TriliumNext/Notes/issues/2191) by @SiriusXT and @herrkami
    *   [Markdown import: restore focus after importing markdown](https://github.com/TriliumNext/Notes/pull/2304) by @SiriusXT
    *   [Ensure images opened in a new tab can be activated](https://github.com/TriliumNext/Notes/pull/2303) by @SiriusXT
*   [Unexpected collapse after hoisting a note](https://github.com/TriliumNext/Notes/pull/2293) by @SiriusXT

## ✨ Improvements

*   [Tab bar: ensure similar behavior between horizontal/vertical scrolling](https://github.com/TriliumNext/Notes/pull/2177) by @SiriusXT and @rom1dep
*   [Two factor: support custom OIDC server](https://github.com/TriliumNext/Notes/pull/2198) by @koderx and @JYC333
*   LLM improvements by @perfectra1n 
    *   [Clarify experimental state](https://github.com/TriliumNext/Notes/pull/2217)
    *   [Simplify (remove embedding system) in order to improve its stability](https://github.com/TriliumNext/Notes/pull/2205)
    *   Simplify provider selection
*   Text editor improvements
    *   [Relocate link icon in floating toolbar](https://github.com/TriliumNext/Notes/pull/2231) by @SiriusXT
    *   [Add text alignment options](https://github.com/TriliumNext/Notes/pull/2232) by @SiriusXT
*   [Display a warning when using the the x86 build on ARM](https://github.com/TriliumNext/Notes/pull/2281) by @perfectra1n

## 📖 Documentation

*   Clarify custom paths for non-root and improve nginx configuration by @hulmgulm
*   Multi-factor authentication clarifications by @JYC333

## 🛠️ Technical updates

*   Express was updated to the newest major version (5).
*   The canvas (Excalidraw) was refactored to use Preact instead of React.
*   Desktop version: remove unnecessary locale information to save some space.
