//IN THE WORKS DO NOT USE YET
#!/usr/bin/env bash

sudo pacman -S --needed base-devel git

mkdir -p ~/GitClones/

sudo pacman -S hyprland waybar grim xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xwaylandvideobridge wl-clipboard dolphin breeze-icons ttf-jetbrains-mono-nerd ffmpegthumbs kdegraphics-thumbnailers archlinux-xdg-menu brightnessctl swaybg hypridle hyprlock
yay -S quickshell hyprpolkitagent xorg-xwayland wpgtk hyprlauncher nwg-drawer

sudo pacman -S python-pywal

git clone https://aur.archlinux.org/wpgtk.git
wpg-install.sh -g

sudo git clone https://github.com/Candys2000/Themeswitcher-hyprland/ ~/GitClones/

sudo mv ~/GitClones/config/hypr ~/.config

sudo mv ~/GitClones/config/kitty ~/.config

sudo mv ~/GitClones/config/wal ~/.config

sudo mv ~/GitClones/config/waybar ~/.config

sudo mv ~/GitClones/config/wpg ~/.config

mkdir ~/Bilder/pictures

sudo mv ~/GitClones/pictures ~/Bilder/pictures

sudo mv ~/GitClones/waybar-colors.sh ~/

sudo mv ~/GitClones/colors-hyprland.sh ~/

sudo rm -r ~/GitClones/

sudo rm -r ~/Downloads/wpgtk
