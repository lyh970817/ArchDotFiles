sh ~/.dotfiles/install/pamac.sh

pacman=$(sed /#/d ./install/pacman.txt|awk 'NF')
yaourt=$(sed /#/d ./install/yaourt.txt|awk 'NF')

for f in $pacman;
do
    sudo pacman -S --noconfirm $f
done

for f in $yaourt;
do
    yaourt -S --noconfirm --holdver $f
done

