#!/usr/bin/env bash

main() {
  curl -fsSL https://pixi.sh/install.sh | sh
  echo "$HOME/.pixi/bin" >> "$GITHUB_PATH"
}

main "$@"
