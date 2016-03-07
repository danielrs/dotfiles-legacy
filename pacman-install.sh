#!/usr/bin/bash

# --------
# Packages
# --------

# Install pacman packages
sudo pacman -S  acpi\
                alsa-utils\
                bc\
                bspwm\
                cmus\
                dmenu\
                feh\
                firefox\
                neovim\
                numix-themes\
                python-neovim\
                nvidia\
                nvidia-libgl\
                libx264\
                pulseaudio\
                refind-efi\
                sudo\
                sxhkd\
                terminus-font\
                the_silver_searcher\
                ttf-dejavu\
                ttf-inconsolata\
                unrar\
                unzip\
                xcursor-vanilla-dmz\
                xcursor-vanilla-dmz-aa\
                xf86-input-evdev\
                xorg-server\
                xorg-xinit\
                xorg-xrandr\
                xorg-xrdb\
                xorg-xset\
                xorg-xsetroot\
                xsel\
                zip

# Manually install yaourt
mkdir yaourt-build
cd yaourt-build
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ../..
rm -rf yaourt-build

# Install yaourt packages
yaourt -S compton-git\
          gbdfed\
          lemonbar-git\
          rxvt-unicode-patched\
          stlarch_font\
          xtitle

# --------
# SSD Configuration
# --------

sudo systemctl enable fstrim.timer
sudo tee -a /etc/sysctl.d/99-sysctl.conf <<< vm.swappiness=10
