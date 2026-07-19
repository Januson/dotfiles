#!/usr/bin/env bash
set -euo pipefail

./scripts/fedora/repos.sh
./scripts/fedora/packages.sh
./scripts/fedora/fonts.sh
./scripts/fedora/starship.sh
./scripts/fedora/rust.sh
