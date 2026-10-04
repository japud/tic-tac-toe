# Tic-Tac-Toe

A single-file, browser-based tic-tac-toe game drawn on graph paper.

## Features

- Three modes: 2 players, vs CPU (easy), vs CPU (hard, unbeatable minimax)
- Running score of wins and draws; the starting player alternates each round
- Shapes menu to swap the marks: X can be a classic X, a 6- or 8-point asterisk, or a 5- or 4-point star; O can be a circle, triangle, square, pentagon or hexagon (saved in the browser)
- Colors menu to change the X and O colors at any time (saved in the browser)
- Keyboard play with the number pad (7-8-9 is the top row)
- Light and dark themes, works on phones
- Installable Android app that plays offline

## Play

Open `tictactoe.html` in a browser, or play the hosted version:
https://claude.ai/artifact/YGrPCTG9ra1EaBSnNnUgJe

## Phone app

Every push to `main` deploys an installable copy to https://japud.github.io/tic-tac-toe/ via GitHub Pages. On Android, open that URL in Chrome and choose **Install app** (or **Add to Home screen**) from the menu. After the first visit it works offline, and it picks up new versions the next time it's opened online.

`pwa/build.sh` builds the same site into `_site/` locally. It wraps `tictactoe.html` in `pwa/head.html` and `pwa/tail.html`, and adds the manifest, icons and service worker.
