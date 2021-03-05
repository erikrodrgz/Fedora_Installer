#!/bin/bash

echo "
Customizando Zsh"
touch ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
source ~/.zshrc

echo "
Criando alias tbx e tbxrun"

echo "alias tbx='toolbox enter -c tbx'" >> ~/.zshrc
echo "alias tbxrun='toolbox run -c tbx'" >> ~/.zshrc
 
echo "alias tbx='toolbox enter -c tbx'" >> ~/.bashrc
echo "alias tbxrun='toolbox run -c tbx'" >> ~/.bashrc

echo "
Criando pergunta do bash"

echo "read -p 'Do you wish to open ZSH [y/n]: ' yn
case \$yn in
   [Yy]* ) exec zsh;;
   [Nn]* ) ;;
   * ) echo 'Please answer yes or no.';;
esac" >> ~/.bashrc

echo "MODIFICAR: 
ZSH_THEME=powerlevel10k/powerlevel10k
plugins=(firewalld git zsh-syntax-highlighting zsh-autosuggestions)"

echo "Please Reboot" && exit 0



