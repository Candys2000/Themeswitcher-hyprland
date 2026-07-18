//IN THE WORKS DO NOT USE YET
#!/usr/bin/env bash

sudo pacman -S --needed base-devel git

mkdir -p ~/GitClones/

sudo pacman -S waybar grim xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xwaylandvideobridge wl-clipboard dolphin breeze-icons ttf-jetbrains-mono-nerd ffmpegthumbs kdegraphics-thumbnailers archlinux-xdg-menu brightnessctl swaybg hypridle hyprlock
yay -S quickshell hyprpolkitagent xwaylandbridge xorg-xwayland wpgtk hyprlauncher nwg-drawer

sudo pacman -S python-pywal

git clone https://aur.archlinux.org/wpgtk.git
cd ~/wpgtk_install && makepkg -si
wpg-install.sh -g
wpgtk

sudo git clone https://github.com/Candys2000/Themeswitcher-hyprland/ ~/GitClones/

sudo mv ~/GitClones/config ~/.config/

sudo mv ~/GitClones/pictures/ ~/Bilder/

sudo mv ~/GitClones/waybar-colors.sh ~/

sudo mv ~/GitClones/colors-hyprland.sh ~/

sudo rm -r ~/GitClones/

sudo rm -r ~/Downloads/wpgtk
