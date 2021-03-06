#!/bin/bash

echo "
Customizando Zsh"
touch ~/.zshrc
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh) --unattended"
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i 's/ZSH_THEME=.*/ZSH_THEME=\"powerlevel10k\/powerlevel10k\"/g' ~/.zshrc
sed -i 's/plugins=.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc

echo "
Criando alias tbx e tbxrun"

echo "alias tbx='toolbox enter -c tbx'" >> ~/.zshrc
echo "alias tbxrun='toolbox run -c tbx'" >> ~/.zshrc
echo "alias adwaita-dark='gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark''" >> ~/.zshrc
echo "alias adwaita='gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita''" >> ~/.zshrc

echo "alias tbx='toolbox enter -c tbx'" >> ~/.bashrc
echo "alias tbxrun='toolbox run -c tbx'" >> ~/.bashrc
echo "alias adwaita-dark='gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark''" >> ~/.bashrc
echo "alias adwaita='gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita''" >> ~/.bashrc

echo "
Criando pergunta do bash"

echo "read -p 'Do you wish to open ZSH [y/n]: ' yn
case \$yn in
   [Yy]* ) exec zsh;;
   [Nn]* ) ;;
   * ) echo 'Please answer yes or no.';;
esac" >> ~/.bashrc      

zsh 

exit 0



