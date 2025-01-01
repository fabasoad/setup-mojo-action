#!/usr/bin/env bash

main() {
  curl -ssL https://magic.modular.com/8dc65f55-3ba2-410c-a46f-4f8f8102a7b7 | bash
  echo "$HOME/.modular/bin" >> "$GITHUB_PATH"
}

main "$@"
