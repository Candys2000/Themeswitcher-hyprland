//IN THE WORKS DO NOT USE YET
#!/usr/bin/env bash

sudo pacman -S --needed base-devel git

mkdir -p ~/GitClones/
git clone "https://github.com/Candys2000/Themeswitcher-hyprland/config"
cd dotfiles
mv .config/* ~/.config/
cd ../..
rm -fr dotfiles

git clone "https://github.com/Candys2000/Themeswitcher-hyprland/pictures"
cd pictures
mv pictures/* ~/Pictures
cd ../..
rm -fr pictures

git clone "https://github.com/Candys2000/Themeswitcher-hyprland/colors-hyprland.sh"
cd colors-hyprland.sh
mv colors-hyprland.sh ~/
cd ../..
rm -fr colors-hyprland.sh

git clone "https://github.com/Candys2000/Themeswitcher-hyprland/waybar-colors.sh"
cd waybar-colors.sh
mv waybar-colors.sh ~/
cd ../..
rm -fr waybar-colors.sh

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
sudo pacman -S base-devel
makepkg -si

sudo pacman -S waybar grim xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xwaylandvideobridge wl-clipboard dolphin breeze-icons ttf-jetbrains-mono-nerd ffmpegthumbs kdegraphics-thumbnailers archlinux-xdg-menu brightnessctl swaybg hypridle hyprlock
yay -S quickshell hyprpolkitagent xwaylandbridge xorg-xwayland wpgtk hyprlauncher nwg-drawer

sudo pacman -S python-pywal

git clone https://aur.archlinux.org/wpgtk.git
cd ~/wpgtk_install && makepkg -si
wpg-install.sh -g
