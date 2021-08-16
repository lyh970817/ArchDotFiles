#!/bin/bash

mkdir -p $HOME/.config
cp -as $(pwd)/config/* $HOME/.config/

mkdir -p $HOME/.local/bin
ln -s $(pwd)/bin/* $HOME/.local/bin/

ln -s $(pwd)/dotfiles/profile $HOME/.profile

ln -s $(pwd)/dotfiles/Xdefaults2 $HOME/.Xdefaults
ln -s $HOME/.Xdefaults $HOME/.Xresources

ln -s $(pwd)/dotfiles/zprofile $HOME/.zprofile
ln -s $(pwd)/dotfiles/xinitrc $HOME/.xinitrc
ln -s $(pwd)/dotfiles/Rprofile $HOME/.Rprofile
cp $(pwd)/dotfiles/gitconfig $HOME/.gitconfig
cp $(pwd)/dotfiles/curlrc $HOME/.curlrc
ln -s $(pwd)/dotfiles/xscreensaver $HOME/.xscreensaver

# sudo ln -s $HOME/Yandex.Disk/Linux/pkgsync/pkg_install.list /etc/pkgsync/pkg_install.list

ln -s $HOME/Yandex.Disk/.tmp $HOME/.tmp
ln -s $HOME/Yandex.Disk/Linux/fcitx $HOME/.config/fcitx

sudo rm /usr/share/gtk-2.0/gtkrc
sudo ln -s ~/.config/gtk-2.0/gtkrc-2.0 /usr/share/gtk-2.0/gtkrc
sudo usermod -a -G video $USER
sudo timedatectl set-ntp true
sudo sed -i 's/AutoEnable.*/AutoEnable = true/' /etc/bluetooth/main.conf

xdg-mime default org.pwmt.zathura-pdf-mupdf.desktop application/pdf

sudo systemctl enable --now v2ray
sudo v2gen -u 'https://1.mxxst2.de/link/IXkdaCmjaXsAz6RG?sub=3&extend=1' --best
