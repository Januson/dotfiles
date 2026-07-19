#!/usr/bin/env bash
set -euo pipefail

for repo in scripts/fedora/repos/*.sh; do
    "$repo"
done
