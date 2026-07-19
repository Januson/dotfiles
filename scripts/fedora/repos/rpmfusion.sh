#!/usr/bin/env bash
set -euo pipefail

VERSION=$(rpm -E %fedora)

sudo dnf install -y \
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-${VERSION}.noarch.rpm" \
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-${VERSION}.noarch.rpm"

sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
