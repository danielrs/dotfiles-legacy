#!/bin/bash

INSTALL_DIR="$HOME/Pictures/Wallpapers/feh/"

BASE_URL="https://wallpapers.wallhaven.cc/wallpapers/full/"
declare -a wallpapers=("wallhaven-655368.jpg")

mkdir -p "${INSTALL_DIR}"
for id in "${wallpapers[@]}"; do
    curl "${BASE_URL}${id}" > "${INSTALL_DIR}${id}"
done
