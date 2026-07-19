//IN THE WORKS DO NOT USE YET
#!/usr/bin/env bash

sudo pacman -S --needed base-devel git

mkdir -p ~/GitClones/

git clone https://aur.archlinux.org/yay.git
cd yay
makepg -si

cd ~/

sudo pacman -S hyprland waybar grim xdg-desktop-portal-hyprland xdg-desktop-portal-gtk wl-clipboard dolphin breeze-icons ttf-jetbrains-mono-nerd ffmpegthumbs kdegraphics-thumbnailers archlinux-xdg-menu brightnessctl swaybg hypridle hyprlock
yay -S quickshell hyprpolkitagent xorg-xwayland wpgtk hyprlauncher nwg-drawer

sudo pacman -S python-pywal

git clone https://aur.archlinux.org/wpgtk.git
wpg-install.sh -g

git clone https://github.com/Candys2000/Themeswitcher-hyprland/ ~/GitClones/

mv ~/GitClones/config/hypr ~/.config

mv ~/GitClones/config/kitty ~/.config

mv ~/GitClones/config/wal ~/.config

mv ~/GitClones/config/waybar ~/.config

mv ~/GitClones/config/wpg ~/.config

mkdir ~/Bilder/pictures

cd ~/

mv ~/GitClones/pictures/ ~/Bilder/pictures

mv ~/GitClones/waybar-colors.sh ~/

mv ~/GitClones/colors-hyprland.sh ~/

sudo rm -r ~/GitClones/

sudo rm -r ~/Downloads/wpgtk
