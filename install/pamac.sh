sudo pacman -S rate-arch-mirrors
sudo rate-arch-mirrors > /etc/pacman.d/mirrorlist
sudo echo $'[archlinuxcn]\nInclude = /etc/pacman.d/archlinuxcn-mirrorlist' >> /etc/pacman.conf
sudo rankmirrors ./install/archlinuxcn-mirrorlist > /etc/pacman.d/archlinuxcn-mirrorlist
sudo pacman -Sy 
sudo pacman -S --noconfirm archlinuxcn-keyring

cd /tmp
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si && cd /tmp/
git clone https://aur.archlinux.org/yaourt.git
cd yaourt/
makepkg -si
yaourt -S --noconfirm pamac-aur
