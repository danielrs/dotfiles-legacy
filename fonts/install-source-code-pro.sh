#!/bin/bash
# This scripts downloads and installs
# source-code-pro 2.030R-ro/1.050R-it
# to the user folder.

DOWNLOAD_URL="https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.tar.gz"
DOWNLOAD_DIR="/tmp/source-code-pro-download"
INSTALL_DIR="$HOME/.fonts/source-code-pro"

# Downloads  and extracts file.
mkdir --parents "$DOWNLOAD_DIR"
wget -qO- "$DOWNLOAD_URL" | tar xvz -C "$DOWNLOAD_DIR"

# Moves the OTF fonts to the user fonts folders.
rm -rv "$INSTALL_DIR"
mkdir --parents "$INSTALL_DIR"
cp "$DOWNLOAD_DIR/source-code-pro-"*"-it/OTF/"*".otf" "$INSTALL_DIR"

# Updates font cache.
fc-cache -fv
