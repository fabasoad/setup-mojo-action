#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  input_force="${1}"

  bin_installed="false"
  if command -v mojo >/dev/null 2>&1; then
    if [ "${input_force}" = "false" ]; then
      msg="Installation skipped."
      bin_installed="true"
    else
      msg="Executing forced installation."
    fi
    log_info "mojo is found at $(which mojo). ${msg}"
  else
    log_info "mojo is not found. Executing installation."
  fi
  echo "bin-installed=${bin_installed}" >> $GITHUB_OUTPUT

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
