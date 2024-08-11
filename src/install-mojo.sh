#!/usr/bin/env sh

main() {
  python_exec_path="${1}"

  curl -s https://get.modular.com | sh -
  ${python_exec_path} -m venv ~/max-venv && source ~/max-venv/bin/activate
  modular install max
  MAX_PATH=$(modular config max.path)
  ${python_exec_path} -m pip install --find-links "${MAX_PATH}/wheels" max-engine
  echo "MODULAR_HOME=${HOME}/.modular" >> "$GITHUB_ENV"
  echo "${MAX_PATH}/bin" >> "$GITHUB_PATH"
}

main "$@"
