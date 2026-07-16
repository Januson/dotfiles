#!/usr/bin/env bash
set -e

podman run --rm -it \
  --userns=keep-id \
  -v "$HOME/.cache/opencode:/home/dev:Z" \
  -v "$PWD:/work:Z" \
  opencode
