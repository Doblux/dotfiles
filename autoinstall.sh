#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


# Global Variables
USER_CONFIG_DIR=$HOME/.config
BACKUPFILES=$HOME/.config/backup

if [ "$(id -u)" = 0 ]; then
  clear
  echo -e "\n${redColour}\t\t WARNING${endColour}"
  echo -e "${purpleColour} Este script no debe ser ejecutado como usuario root ${endColour}"
  echo -e "${purpleColour} Se pediran permisos de administrador cuando sean necesarios${endColour}"
  echo -e "${yellowColour}[+]${endColour}\t\t${redColour} Saliendo ...${endColour}"
  exit 1
fi

# Instalamos los paquetes basicos de pacman
sudo pacman -S --needed --noconfirm nvidia nvidia-settings nvidia-utils amd-ucode pulseaudio alsa-utils bspwm sxhkd git wget neovim rofi ranger alacritty firefox base-devel xorg xorg-xinit xclip p7zip unzip picom udiskie udisks2 numlockx flameshot wmname feh pcmanfm zathura zsh deluge deluge-gtk lxappearance lsd bat ueberzug xdg-user-dirs mlocate

# Creacion de los directorios por defecto del usuario
xdg-user-dirs-update

# paru aur helper
git clone https://aur.archlinux.org/paru.git
mv paru/* .
makepkg -si
rm -rf paru/ *tar.zst *tar.gz pkg/ PKGBUILD src/

paru -S --needed --noconfirm polybar masterpdfeditor spotify keepass discord candy-icons-git sweet-dark-theme

mkdir -p $BACKUPFILES

# Personal configs
if [[ -d $USER_CONFIG_DIR ]]; then
  mv $USER_CONFIG_DIR $BACKUPFILES
fi

git clone https://github.com/Doblux/dotfiles
rm -rf dotfiles/config/nvim
cp -r dotfiles/config $USER_CONFIG_DIR
mkdir $USER_CONFIG_DIR/X11
mv dotfiles/config/xinitrc-bspwm $USER_CONFIG_DIR/X11/.xinitrc-bspwm

# Asignamos permisos de ejecucion al bspwmrc para que xorg de pantalla
chmod +x $USER_CONFIG_DIR/bspwm/bspwmrc
chmod +x $USER_CONFIG_DIR/polybar/launch.sh # Polybar launch necesita ser ejecutable

# fondo de pantalla
mv dotfiles/encrusted-xi-ii.jpg $HOME/Imágenes

# Instalación de Powerlevel10k (ZSH)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Instalamos powerlevel10k para root
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k
sudo echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >> /root/.zshrc

sudo rm /root/.zshrc
rm $HOME/.zshrc
cp dotfiles/zshrc $HOME/.zshrc
sudo ln -s -f $HOME/.zshrc /root/.zshrc

sudo usermod --shell /usr/bin/zsh $USER
sudo usermod --shell /usr/bin/zsh root

mv dotfiles/zprofile $HOME/.zprofile
# FZF FUZZER COMPLETION
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
$HOME/.fzf/install

# FZF FUZZER COMPLETION FOR ROOT USER
sudo git clone --depth 1 https://github.com/junegunn/fzf.git /root/.fzf
sudo /root/.fzf/install

# ZSH-PLUGINS
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh
sudo mkdir -p /usr/share/zsh-sudo
sudo mv sudo.plugin.zsh /usr/share/zsh-sudo/
paru -S --noconfirm --needed zsh-syntax-highlighting zsh-autosuggestions

# Hack Nerd Fonts
sudo mkdir -p /usr/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip
sudo mv *.ttf /usr/share/fonts
rm *.zip

# Oh My tmux para usuario normal
git clone https://github.com/gpakosz/.tmux.git /home/$USER/.tmux
ln -s -f .tmux/.tmux.conf /home/$USER
cp /home/$USER/.tmux/.tmux.conf.local /home/$USER

# Oh My Tmux para root
sudo git clone https://github.com/gpakosz/.tmux.git /root/.tmux
sudo ln -s -f .tmux/.tmux.conf /root
sudo cp /root/.tmux/.tmux.conf.local /root

# Instalacion del neovim NvChad
git clone https://github.com/NvChad/NvChad $USER_CONFIG_DIR/nvim --depth 1
nvim +'hi NormalFloat guibg=#1e222a' +PackerSync

# NvChad para root
sudo mkdir -p /root/.config
sudo git clone https://github.com/NvChad/NvChad /root/.config/nvim --depth 1
sudo nvim +'hi NormalFloat guibg=#1e222a' +PackerSync

updatedb
sleep 2
sudo reboot
