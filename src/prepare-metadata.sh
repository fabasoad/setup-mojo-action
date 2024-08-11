#!/usr/bin/env sh

main() {
  input_force="${1}"

  to_install="false"
  if [ "${input_force}" = "true" ] || ! command -v mojo >/dev/null 2>&1; then
    to_install="true"
  fi
  echo "to-install=${to_install}" >> "$GITHUB_OUTPUT"

  python_exec=""
  if command -v python >/dev/null 2>&1; then
    python_exec="$(which python)"
  elif command -v python3 >/dev/null 2>&1; then
    python_exec="$(which python3)"
  elif command -v python3.11 >/dev/null 2>&1; then
    python_exec="$(which python3.11)"
  elif command -v python3.10 >/dev/null 2>&1; then
    python_exec="$(which python3.10)"
  elif command -v python3.9 >/dev/null 2>&1; then
    python_exec="$(which python3.9)"
  fi
  echo "python-exec=${python_exec}" >> "$GITHUB_OUTPUT"
}

main "$@"
