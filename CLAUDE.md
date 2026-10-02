# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

A browser tic-tac-toe game in a single file, `tictactoe.html`, with inline CSS and JS. There's no build step, package manager, linter or test suite. To run it, open the file in a browser (`xdg-open tictactoe.html`).

It's also hosted as a claude.ai Artifact at https://claude.ai/artifact/YGrPCTG9ra1EaBSnNnUgJe. After changing the game, republish `tictactoe.html` to that URL so the hosted copy stays current.

## Workflow

- After every change, make a clean, descriptive commit (one logical change per commit) and push to `origin main` (https://github.com/japud/tic-tac-toe, private). The user relies on this history to revert changes.
- Keep `README.md`'s feature list in sync when features change.

## Artifact constraints on `tictactoe.html`

The file is written as an Artifact page, which affects how it's edited:
- It has no `<!doctype>`, `<html>`, `<head>` or `<body>` tags, because the Artifact publisher wraps it in that skeleton. Don't add them.
- External resources are limited to Google Fonts and the CDN allowlist (cdnjs etc.). Inline everything else.
- `alert`/`confirm`/`prompt` don't work in the viewer. Build any dialogs into the page itself.
- `localStorage` can be empty or throw, so keep every access in try/catch.

## Architecture (inside `tictactoe.html`)

- **Theming:** every color is a CSS custom property. Light values sit on `:root`, and dark values are repeated in two places: `@media (prefers-color-scheme: dark) :root:not([data-theme="light"])` and `:root[data-theme="dark"]`. Change both dark blocks together.
- **Mark colors:** X and O take their colors from `--ink-x` and `--ink-o`. The Colors menu sets these as inline properties on `<html>`, which override the theme values, so drawn marks, the score and the title recolor instantly in any game state. Removing the inline property restores the theme default. The choice persists in `localStorage` under the key `ttt-colors`.
- **Game state:** one object `S` holds `{mode, cells[9], turn, starter, score, over, winLine}`. `fresh(prev)` starts a new round, keeping the score and mode and switching who goes first. `play(i)` is the only function that changes the board. `render()` redraws from `S`, and only animates the cell that was just played.
- **CPU:** the CPU always plays O. `maybeCpu()` schedules its move after `play()` runs and on each new round. `hard` uses a full minimax with depth scoring; `easy` picks a random move 70% of the time.
- **Hot reload:** `window.claude.hot.snapshot`/`ready` keep `S` when the Artifact is republished while a viewer has the page open.
