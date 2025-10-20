#!/bin/bash

# Este script detendrá la ejecución si algún comando falla.
set -e

# --- LISTA DE PAQUETES A INSTALAR ---
PAQUETES=(
    alsa-utils
    bluez
    bluez-tools
    bluez-utils
    code
    pavucontrol
    pipewire
    pipewire-alsa
    pipewire-jack
    pipewire-pulse
    rofi
    unzip
    waybar
    wget
    wireplumber
)
PAQUETES_AUR=(
    hyprpaper
    sublime-text-4
    getnf
)

# --- INSTALACIÓN de PAQUETES ---

echo "-- Iniciando la instalación de los paquetes .."
sudo pacman -Syu --needed --noconfirm "${PAQUETES[@]}"

# --- INSTALACION Dotfiles ---
echo "-- Iniciando la instalación de los Dotfiles .."

rm -r ../.config/hypr
cp -r wallpaper/ ../.config/
cp -r hypr/ ../.config/
cp -r kitty/ ../.config/
cp -r waybar/ ../.config/


# --- INSTALACIÓN de YAY y PAQUETES_AUR ---

sudo pacman -S --needed --noconfirm git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
yay -Syu --needed --noconfirm "${PAQUETES_AUR[@]}"

reboot
