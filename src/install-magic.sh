#!/usr/bin/env bash

# Installs magic and creates a mojo compatiblity script

main() {
  curl -ssL https://magic.modular.com/8dc65f55-3ba2-410c-a46f-4f8f8102a7b7 | bash
  echo "$HOME/.modular/bin" >> "$GITHUB_PATH"
  # so people can use mojo instead of magic run mojo
  cat > "$HOME/.modular/bin/mojo" << EOF
#!/usr/bin/env bash

magic run mojo $*
EOF
  chmod a+rx "$HOME/.modular/bin/mojo"
}

main "$@"
