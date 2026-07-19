#!/usr/bin/env bash
set -euo pipefail

enable_copr() {
    local repo="$1"

    if dnf copr list --enabled | grep -q "^${repo}$"; then
        echo "COPR $repo already enabled"
    else
        sudo dnf -y copr enable "$repo"
    fi
}

sudo dnf install -y dnf-plugins-core

enable_copr scottames/ghostty
