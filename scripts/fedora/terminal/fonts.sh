#!/usr/bin/env bash
set -euo pipefail

echo "Downloading..."
curl -o /tmp/Hack.zip -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip

echo "Unzipping..."
unzip /tmp/Hack.zip -d ~/.local/share/fonts/

echo "Installing..."
fc-cache -vf ~/.local/share/fonts/

echo "Verifying..."
fc-list : family style | grep -i nerd
