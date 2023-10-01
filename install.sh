#!/bin/ash
# execute commands with custom messages
execute_command() {
  local command="$1"
  local description="$2"
  echo "Executing: $command"
  echo "$description..."
  eval "$command" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "Success: $description"
  else
    echo "Failed to $description"
    echo "Error: $error_output"
  fi
}
# apk
execute_command "sed -i '/^#.*community$/s/^#//' /etc/apk/repositories" "activating community repositories"
execute_command "apk update" "updating repositories"
execute_command "cp ./cougar_pde/.bashrc ." "getting .bashrc"
execute_command "cp ./cougar_pde/.bash_prompt ." "getting .bash_prompt"
execute_command "cp ./cougar_pde/.bash_aliases ." "getting .bash_aliases"
execute_command "cp ./cougar_pde/.git-prompt.sh ." "getting .git-prompt.sh"
execute_command "rm .ashrc" "removing .ashrc"
execute_command "rm .ash_history" "removing .ash_history"
execute_command "touch .bash_history" "creating .bash_history"
execute_command "apk add bash-doc" "adding bash-doc"
execute_command "apk add bash-completion" "adding bash-completion"
execute_command "apk add bash" "adding bash"
execute_command "apk add shadow" "adding shadow"
execute_command "sed -i 's#/bin/ash#/bin/bash#g' /etc/passwd" "Setup bash as default shell"
execute_command "apk add mandoc man-pages" "adding man pages"
execute_command "apk add sudo" "adding sudo"
execute_command "apk add neofetch" "adding neofetch"
execute_command "apk add cmake" "adding cmake"
execute_command "apk add build-base" "adding linux building tools"
# docker
execute_command "apk add docker" "adding docker"
execute_command "apk add docker-compose" "adding docker-compose"
# neovim
execute_command "apk add ripgrep" "adding ripgrep"
execute_command "apk add gettext-dev" "adding gettext-dev"
echo "installing neovim (it can take some minutes)"
git clone https://github.com/neovim/neovim /tmp/neovim
cd /tmp/neovim
# git checkout stable // won't work
execute_command "make CMAKE_BUILD_TYPE=RelWithDebInfo" "compiling neovim"
execute_command "make install" "installing neovim"
# rm -rf /tmp/neovim
cd $HOME
# neovim custom setup
if [ -d ~/.config/nvim ] ; then
    execute_command "git clone https://github.com/Crater44/nvim-config.git ~/.config/nvim" "getting custom neovim setup"
fi
execute_command "source ~/.bashrc" "source .bashrc"

echo -e "Welcome to your Personalized Develompent Environtment
.------..------..------..------..------..------.
|C.--. ||O.--. ||U.--. ||G.--. ||A.--. ||R.--. |
| :/\: || :/\: || (\/) || :/\: || (\/) || :(): |
| :\/: || (__) || :\/: || :\/: || :\/: || ()() |
| '--'C|| '--'O|| '--'U|| '--'G|| '--'A|| '--'R|
\`------'\`------'\`------'\`------'\`------'\`------'
"
echo -e "\nRun 'chsh -s /bin/bash and neofetch' to change shell and check out the details of the shell"