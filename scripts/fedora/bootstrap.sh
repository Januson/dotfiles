#!/usr/bin/env bash
set -euo pipefail

./scripts/fedora/repos.sh
./scripts/fedora/packages.sh

./scripts/fedora/terminal.sh
./scripts/fedora/tweaks.sh
