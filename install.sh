#!/bin/bash
append_if_not_exists() {
  local new_content="$1"
  local file_path="$2"
  if ! grep -qF "$new_content" "$file_path"; then
    echo "$new_content" >> "$file_path"
  fi
}

append_if_not_exists "source ~/.bash_prompt" "~/.bashrc"
append_if_not_exists "source ~/.git-prompt" "~/.bashrc"
append_if_not_exists "LS_COLORS=\$LS_COLORS:'di=1;31:'; export LS_COLORS" "~/.bashrc"

cp ./.bash_prompt ~/.bash_prompt
cp ./.git-prompt ~/.git-prompt

source ~/.bashrc

echo "Ow yeah
.------..------..------..------..------..------.     .------..------..------.
|C.--. ||O.--. ||U.--. ||G.--. ||A.--. ||R.--. |.-.  |P.--. ||D.--. ||E.--. |
| :/\: || :/\: || (\/) || :/\: || (\/) || :(): ((5)) | :/\: || :/\: || (\/) |
| :\/: || :\/: || :\/: || :\/: || :\/: || ()() |'-.-.| (__) || (__) || :\/: |
| '--'C|| '--'O|| '--'U|| '--'G|| '--'A|| '--'R| ((1)) '--'P|| '--'D|| '--'E|
\`------'\`------'\`------'\`------'\`------'\`------'  '-'\`------'\`------'\`------'
"
