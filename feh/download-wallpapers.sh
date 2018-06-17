#!/bin/bash

INSTALL_DIR="$HOME/Pictures/Wallpapers/feh/"

BASE_URL="https://wallpapers.wallhaven.cc/wallpapers/full/"
declare -a wallpapers=("wallhaven-655368.jpg" "wallhaven-662258.jpg")

mkdir -p "${INSTALL_DIR}"
for id in "${wallpapers[@]}"; do
    if [ ! -f ${INSTALL_DIR}${id} ]; then
        curl "${BASE_URL}${id}" > "${INSTALL_DIR}${id}"
    fi
done
