#!/usr/bin/env bash
set -euo pipefail

rustup toolchain install stable
rustup target add wasm32-unknown-unknown

curl -sSL https://dioxus.dev/install.sh | bash

sudo dnf install -y \
 webkit2gtk4.1-devel \
 libxdo-devel \
 openssl-devel \
 librsvg2-devel \
 clang \
 lld \
 gcc \
 gcc-c++ \
 make \
 pkg-config
