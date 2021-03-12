#!/bin/bash

echo "
Trocando o nome do computadora para rodrgz"
hostnamectl set-hostname rodrgz

echo "
Cancelando operações rpm-ostree em execução"
rpm-ostree cancel

echo "
Realizando atualizações"
rpm-ostree upgrade

echo "
Sobrepondo Firefox do sistema"
rpm-ostree override remove firefox

echo "
Instalando power-profiles-daemon e zsh"
rpm-ostree install power-profiles-daemon zsh

echo "
Removendo gnome-software da inicialização"
sudo rm /etc/xdg/autostart/gnome-software-service.desktop

echo "
Adicionando Flathub"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "
Instalando programas Flatpak"

flatpak install flathub -y                     \
      ca.desrt.dconf-editor                    \
      com.github.gi_lom.dialect                \
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

echo "
Adicionando fontes para o Zsh"
mkdir -p ~/.local/share/fonts 
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.local/share/fonts/

echo "
Sobrepondo environment Qt do Telegram para executar por xcb" 
sudo flatpak override --env=QT_QPA_PLATFORM=xcb org.telegram.desktop

echo "
Criando Toolbox" 
toolbox create -c tbx -y

echo "
Executando Script de instalação dos programas da Toolbox"
toolbox run -c tbx sudo sh ./install_toolbox.sh 

echo "
Configurando co-existência entre WiFi e Bluetooth"
echo 'options iwlwifi bt_coex_active=0' | sudo tee -a /etc/modprobe.d/iwlwifi.conf

echo "
Configurando preferências do GNOME"
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.shell disable-user-extensions true
gsettings set org.gnome.desktop.interface font-hinting 'full' 
gsettings set org.gnome.desktop.interface font-antialiasing 'rgba' 
gsettings set org.gnome.software download-updates false
gsettings set org.gnome.software download-updates-notify false

echo "
Please Reboot"
systemctl reboot

exit 0



