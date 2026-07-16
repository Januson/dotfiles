#!/usr/bin/env bash
set -e

podman run --rm -it \
  --userns=keep-id \
  -e CONTEXT7_KEY="$(cat ~/.secrets/context7)" \
  -v "$HOME/.cache/opencode:/home/dev:Z" \
  -v "$PWD:/work:Z" \
  opencode
