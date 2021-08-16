#! /bin/bash

if [[ $SHELL != "/usr/bin/zsh"  ]];then
    chsh -s /usr/bin/zsh $USER
fi

sudo systemctl enable getty@tty1.service
sudo cp -r ./getty@tty1.service.d /etc/systemd/system/

