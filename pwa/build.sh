#!/usr/bin/env bash
# Builds the installable phone app into _site/: wraps tictactoe.html (an Artifact page with no
# <head>) in a full document, and copies the manifest, icons and service worker next to it.
set -euo pipefail
cd "$(dirname "$0")/.."

rm -rf _site && mkdir _site
cat pwa/head.html tictactoe.html pwa/tail.html > _site/index.html
cp pwa/manifest.webmanifest pwa/icon.svg pwa/icon-192.png pwa/icon-512.png _site/
sed "s/__VERSION__/$(git rev-parse --short HEAD 2>/dev/null || date +%s)/" pwa/sw.js > _site/sw.js
echo "Built _site/"
