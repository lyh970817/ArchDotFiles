sudo pacman -Q|sed s/[[:space:]].*$//g|sort > /tmp/pkg.txt
sed /#/d pacman.txt|awk 'NF'|sort > /tmp/pacman.txt 
sed /#/d yaourt.txt|awk 'NF'|sort > /tmp/yaourt.txt 

comm -2 -3 /tmp/pacman.txt /tmp/pkg.txt
for f in $pacman;
do
    sudo pacman -S --noconfirm $f
done

for f in $yaourt;
do
    yaourt -S --noconfirm --holdver $f
done

