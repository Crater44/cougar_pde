#!/bin/bash
append_if_not_exists() {
  local new_content="$1"
  local file_path="$2"
  if ! grep -qF "$new_content" "$file_path"; then
    echo -e "$new_content" >> "$file_path"
  fi
}

append_if_not_exists "source $HOME/.bash_prompt \n" "$HOME/.bashrc"
append_if_not_exists "source $HOME/.git-prompt \n" "$HOME/.bashrc"
append_if_not_exists "LS_COLORS=\$LS_COLORS:'di=1;31:'; export LS_COLORS \n" "$HOME/.bashrc"

cp .bash_prompt $HOME/.bash_prompt
cp .git-prompt $HOME/.git-prompt

echo "Now execute 'source $HOME/.bashrc'
.------..------..------..------..------..------.     .------..------..------.
|C.--. ||O.--. ||U.--. ||G.--. ||A.--. ||R.--. |.-.  |P.--. ||D.--. ||E.--. |
| :/\: || :/\: || (\/) || :/\: || (\/) || :(): ((5)) | :/\: || :/\: || (\/) |
| :\/: || :\/: || :\/: || :\/: || :\/: || ()() |'-.-.| (__) || (__) || :\/: |
| '--'C|| '--'O|| '--'U|| '--'G|| '--'A|| '--'R| ((1)) '--'P|| '--'D|| '--'E|
\`------'\`------'\`------'\`------'\`------'\`------'  '-'\`------'\`------'\`------'
"
