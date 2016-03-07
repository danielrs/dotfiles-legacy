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
                jdk8-openjdk\
                libx264\
                mpv\
                neovim\
                nodejs\
                npm\
                ntfs-3g\
                numix-themes\
                nvidia-libgl\
                nvidia\
                openssh\
                pulseaudio\
                python-neovim\
                refind-efi\
                sudo\
                sxhkd\
                terminus-font\
                the_silver_searcher\
                ttf-dejavu\
                ttf-inconsolata\
                unrar\
                unzip\
                xcursor-vanilla-dmz-aa\
                xcursor-vanilla-dmz\
                xf86-input-evdev\
                xorg-server\
                xorg-xinit\
                xorg-xrandr\
                xorg-xrdb\
                xorg-xset\
                xorg-xsetroot\
                xsel\
                zathura-pdf-mupdf\
                zathura\
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
          leiningen\
          lemonbar-git\
          rxvt-unicode-patched\
          stlarch_font\
          xtitle

# --------
# SSD Configuration
# --------

sudo systemctl enable fstrim.timer
sudo tee -a /etc/sysctl.d/99-sysctl.conf <<< vm.swappiness=10
