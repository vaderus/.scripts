#!/bin/bash

#baixar os arquivos
mkdir /home/gabriel/.sources/
git clone https://github.com/vaderus/dwm /home/gabriel/.sources/dwm
git clone https://github.com/vaderus/st /home/gabriel/.sources/st
git clone https://github.com/vaderus/slstatus /home/gabriel/.sources/slstatus
git clone https://github.com/vaderus/dmenu /home/gabriel/.sources/dmenu
git clone https://aur.archlinux.org/paru.git /home/gabriel/.sources/paru-git
mv /home/gabriel/.scripts/colors /home/gabriel/.sources/
echo "gits baixados"

#repos
pacman -S artix-archlinux-support
rm -r /etc/pacman.conf
cp /home/gabriel/.scripts/pacman.conf /etc/pacman.conf
pacman -Syyu
echo "repos configurados"

#dependências
pacman -Syu xorg xorg-server xorg-xinitrc libx11 libxinerama gnu-free-fonts xwallpaper
cd /home/gabriel/.sources/paru-git && makepkg PKGBUILD
echo "paru instalado"
paru -S libxft-bgra ttf-font-awesome-4 ttf-joypixels

#compilar e instalar tudo
make clean install -C /home/gabriel/.sources/dwm
make clean install -C /home/gabriel/.sources/slstatus
make clean install -C /home/gabriel/.sources/dmenu
make clean install -C /home/gabriel/.sources/st
touch /home/gabriel/.xinitrc
echo "xwallpaper --zoom /home/gabriel/midia/ims/wpps/wall/
xrandr -s 1920x1080
slstatus &
picom &
setxkbmap br
exec dwm" >> /home/gabriel/.xinitrc
echo "v.a.p.i concluído, pode iniciar o x com startx"
