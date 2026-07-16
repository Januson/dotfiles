#!/usr/bin/env bash
set -e

podman run --rm -it \
  -u $(id -u):$(id -g) \
  -v "$HOME/.config/opencode:/home/dev/.config/opencode:Z" \
  -v "$HOME/.cache/opencode:/home/dev/.cache/opencode:Z" \
  -v "$PWD:/work:Z" \
  opencode
