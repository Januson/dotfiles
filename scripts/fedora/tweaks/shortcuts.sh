#!/usr/bin/env bash
set -euo pipefail

add-shortcut() {
    local name="$1"
    local command="$2"
    local binding="$3"

    local schema="org.gnome.settings-daemon.plugins.media-keys"

    if [[ $# -ne 3 ]]; then
        echo "Usage: add-shortcut <name> <command> <binding>"
        return 1
    fi

    command -v gsettings >/dev/null || {
        echo "Error: gsettings is not installed."
        return 1
    }

    # Warn if the executable isn't on PATH. Skip shell commands.
    if [[ "$command" != *" "* ]] && ! command -v "$command" >/dev/null; then
        echo "Warning: '$command' is not on your PATH."
    fi

    local current
    current=$(gsettings get "$schema" custom-keybindings)

    # Find next free slot and check for duplicate names.
    local i=0
    while [[ "$current" == *"custom$i"* ]]; do
        local path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom$i/"
        local base="$schema.custom-keybinding:$path"

        local existing_name
        existing_name=$(gsettings get "$base" name 2>/dev/null | tr -d "'")

        if [[ "$existing_name" == "$name" ]]; then
            echo "Error: shortcut '$name' already exists."
            return 1
        fi

        ((i++))
    done

    local path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom$i/"

    # Append to the existing list.
    local new
    if [[ "$current" == "@as []" || "$current" == "[]" ]]; then
        new="['$path']"
    else
        new="${current%]}"
        new="$new, '$path']"
    fi

    gsettings set "$schema" custom-keybindings "$new"

    local base="$schema.custom-keybinding:$path"

    gsettings set "$base" name "$name"
    gsettings set "$base" command "$command"
    gsettings set "$base" binding "$binding"

    echo "✓ Added shortcut"
    echo "  Name    : $name"
    echo "  Command : $command"
    echo "  Binding : $binding"
    echo "  Slot    : custom$i"
}

add-shortcut "Ghostty" "ghostty" "<Super>t"
