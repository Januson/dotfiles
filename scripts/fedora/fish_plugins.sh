#!/usr/bin/env bash
set -euo pipefail

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish \
 | source && fisher install jorgebucaran/fisher

fisher install reitzig/sdkman-for-fish
