#!/bin/bash

###
# Optionally clean all dnf temporary files
###

sudo echo 'fastestmirror=1' >> /etc/dnf/dnf.conf

sudo dnf clean all

sudo dnf upgrade --best --allowerasing --refresh -y

sudo dnf distro-sync -y

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc &&\
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo' &&\
sudo dnf upgrade -y --nogpgcheck && sudo dnf install -y --nogpgcheck \
pdf2svg \
libnsl \
xclip \
xterm \
codeblocks \
codeblocks-contrib \
cmake \
julia \
gfortran \
gcc \
gcc-c++ \
gcc-gfortran \
gdb \
gmsh \
gmsh-devel \
lyx \
gmsh \
paraview \
codeblocks \
codeblocks-contrib \
openmpi \
openmpi-devel \
texlive-scheme-full \
texlive-pgfplots \
texlive-luacode \
jetbrains-mono-fonts-all \
cmake \
make \
mpich \
firefox \
conda \
java-11-openjdk \
java-11-openjdk-devel \
youtube-dl \
onedrive \
unar \
nano \
motif \
libnsl \
zsh \
libpng12 \
util-linux-user \
lsb \
evince \
a2x \
asciidoc \
sassc \
mutter \
gnome-shell \
dbus-daemon \
mesa-dri-drivers \
gettext-devel \
yelp-tools \
meson
   
sudo dnf groupinstall -y 'C Development Tools and Libraries'

wget https://pt-br.libreoffice.org/assets/Uploads/PT-BR-Documents/VERO/ptBR-2013-10-30AOC-2.zip
unzip ptBR-2013-10-30AOC-2.zip
sudo mv pt_BR.aff  /usr/share/myspell
sudo mv pt_BR.dic  /usr/share/myspell
cd ..

conda create -n PythonEnv -c conda-forge notebook numpy pandas

mkdir BUILD && cd BUILD
git clone https://github.com/sourceryinstitute/OpenCoarrays
cd ./OpenCoarrays
sudo ./install.sh -c gcc -C g++ -f gfortran -m cmake  -j 2  --prefix-root /opt -y
cd .. 

#The user needs to reboot to apply all changes.
echo "Please Reboot" && exit 0
