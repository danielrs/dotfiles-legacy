#!/usr/bin/bash

# --------
# Packages
# --------

# Install pacman packages
pacman -S acpi\
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
          pulseaudio\
          refind-efi\
          sudo\
          terminus-font\
          the_silver_searcher\
          ttf-inconsolata\
          unrar\
          unzip\
          xcursor-vanilla-dmz\
          xcursor-vanilla-dmz-aa\
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

systemctl enable fstrim.timer
tee -a /etc/sysctl.d/99-sysctl.conf <<< vm.swappiness=10
