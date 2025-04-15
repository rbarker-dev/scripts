#!bash

SCRIPTS=(gclone.sh cwf.sh wtfis.sh)

for script in "${SCRIPTS[@]}"; do
  cp "${script}" "${HOME}/.oh-my-zsh/custom/${script%.sh}.zsh" || { echo "Error copying ${script}" >&2; return 1; }
done

echo "Moved scripts to '~/.oh-my-zsh/custom' run 'zsh' to pickup changes"

