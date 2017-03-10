#!/bin/bash

# Install yaourt
mkdir yaourt-build
cd yaourt-build
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si --noconfirm
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si --noconfirm
cd ../..
rm -rf yaourt-build
