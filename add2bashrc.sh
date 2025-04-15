#!bash

SCRIPTS=(cwf.sh gclone.sh wtfis.sh)

echo "Moving scripts to ~/.custom_scripts"
mkdir -p ~/.custom_scripts

for script in "${SCRIPTS[@]}"; do
    cp "${script}" ~/.custom_scripts/"${script}" || { echo "Error copying ${script}" >&2; return 1; }
    chmod +x ~/.custom_scripts/"${script}" || { echo "Error adding executable permissions ${script}" >&2; return 1; }

done

echo "Adding ~/.custom_scripts to PATH in ~/.bashrc if not already present"
if ! grep -q 'export PATH="$HOME/.custom_scripts:$PATH"' ~/.bashrc; then
  echo 'export PATH="$HOME/.custom_scripts:$PATH"' >> ~/.bashrc
fi

echo "Done. Restart your terminal or run 'source ~/.bashrc' to apply changes."

