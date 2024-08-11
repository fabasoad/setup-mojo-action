#!/usr/bin/env sh

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
