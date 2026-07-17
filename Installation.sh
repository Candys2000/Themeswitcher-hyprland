//IN THE WORKS DO NOT USE YET
mkdir -p ~/GitClones/
git clone "https://github.com/candeez/dotfiles"
cd dotfiles
mv .config/* ~/.config/
cd ../..
rm -fr dotfiles
