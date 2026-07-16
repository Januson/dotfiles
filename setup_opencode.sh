#!/usr/bin/env bash
set -e

OPENCODE_HOME=~/.cache/opencode

mkdir -p "${OPENCODE_HOME}/.config/opencode"
mkdir -p "${OPENCODE_HOME}/.cache/opencode/bin"
mkdir -p "${OPENCODE_HOME}/.local/share/opencode/repos"
mkdir -p "${OPENCODE_HOME}/.local/share/opencode/log"
mkdir -p "${OPENCODE_HOME}/.local/share/state/opencode"
