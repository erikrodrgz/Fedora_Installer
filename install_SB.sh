#!/bin/bash

rpm-ostree upgrade

rpm-ostree override remove firefox

rpm-ostree install power-profiles-daemon zsh

sudo rm /etc/xdg/autostart/gnome-software-service.desktop

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub \
      ca.desrt.dconf-editor  \
      com.github.gi_lom.dialect  \
      com.github.johnfactotum.Foliate          \
      com.github.maoschanz.drawing             \
      com.github.tchx84.Flatseal               \
      com.github.wwmm.pulseeffects             \
      com.microsoft.Teams                      \
      com.obsproject.Studio                    \
      com.rafaelmardojai.Blanket               \
      com.skype.Client                         \
      com.spotify.Client                       \
      com.stremio.Stremio                      \
      com.transmissionbt.Transmission          \
      com.vscodium.codium                      \
      de.haeckerfelix.Fragments                \
      fyi.zoey.TeX-Match                       \
      io.typora.Typora                         \
      net.ankiweb.Anki                         \
      org.audacityteam.Audacity                \
      org.fedoraproject.MediaWriter            \
      org.gnome.Boxes                          \
      org.gnome.Builder                        \
      org.gnome.Polari                         \
      org.gnome.Solanum                        \
      org.gnome.SoundRecorder                  \
      org.gnome.Totem                          \
      org.inkscape.Inkscape                    \
      org.libreoffice.LibreOffice              \
      org.mozilla.firefox                      \
      org.gnome.gitlab.YaLTeR.VideoTrimmer     \
      org.zotero.Zotero                        \
      us.zoom.Zoom

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
mkdir ~/.local/share/fonts && cd ~/.local/share/fonts && wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf && cd
source ./.zshrc

sudo flatpak override --env=QT_QPA_PLATFORM=xcb org.telegram.desktop

toolbox create -c tbx
toolbox run -c tbx sh ./install_toolbox.sh 

echo 'alias tbx="toolbox enter -c tbx' >> ~/.zshrc
echo 'alias tbxrun="toolbox run -c tbx' >> ~/.zshrc

echo 'alias tbx="toolbox enter -c tbx' >> ~/.bashrc
echo 'alias tbxrun="toolbox run -c tbx' >> ~/.bashrc


echo 'read -p "Do you wish to open ZSH?" yn
case $yn in
   [Yy]* ) exec zsh;;
   [Nn]* ) ;;
   * ) echo "Please answer yes or no.";;
esac' >> ~/.bashrc

sudo echo 'options iwlwifi bt_coex_active=0' >> /etc/modprobe.d/iwlwifi.conf

gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.shell disable-user-extensions true
gsettings set org.gnome.desktop.interface font-hinting 'full' 
gsettings set org.gnome.desktop.interface font-antialiasing 'rgba' 

#The user needs to reboot to apply all changes.

echo "MODIFICAR: 
ZSH_THEME=powerlevel10k/powerlevel10k
plugins=(firewalld git zsh-syntax-highlighting zsh-autosuggestions)"

echo "Please Reboot" && exit 0



