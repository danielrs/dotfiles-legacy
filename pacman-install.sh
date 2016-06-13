#!/usr/bin/bash

# --------
# Packages
# --------

# Install pacman packages for environment
sudo pacman -S  acpi\
                alsa-utils\
                bc\
                bspwm\
                cmus\
                connman\
                dmenu\
                feh\
                firefox\
                libx264\
                maim\
                mpv\
                ntfs-3g\
                mlocate\
                numix-themes\
                nvidia-libgl\
                nvidia\
                openssh\
                pulseaudio\
                refind-efi\
                sudo\
                sxhkd\
                terminus-font\
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

# Install development packages
sudo pacman -S  ctags\
                dos2unix\
                neovim\
                nodejs\
                npm\
                the_silver_searcher\
                postgresql\
                python-neovim\

# Install Elixir packages
sudo pacman -S elixir
               inotify-tools

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

# Install yaourt development packages
yaourt -S leiningen

# --------
# SSD Configuration
# --------

sudo systemctl enable fstrim.timer
sudo tee -a /etc/sysctl.d/99-sysctl.conf <<< vm.swappiness=10
