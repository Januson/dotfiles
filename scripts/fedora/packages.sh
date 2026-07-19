#!/usr/bin/env bash
set -euo pipefail

./scripts/fedora/packages/packages.sh
./scripts/fedora/packages/rust.sh
