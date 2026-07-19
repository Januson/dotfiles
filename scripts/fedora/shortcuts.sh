#!/usr/bin/env bash

list-shortcuts() {
    local schema="org.gnome.settings-daemon.plugins.media-keys"
    local paths

    paths=$(gsettings get "$schema" custom-keybindings)

    [[ "$paths" == "@as []" || "$paths" == "[]" ]] && {
        echo "No custom shortcuts."
        return
    }

    echo "Custom shortcuts:"
    echo

    grep -o "/org/[^']*/" <<<"$paths" | while read -r path; do
        local base="$schema.custom-keybinding:$path"

        printf "%-20s %-15s %s\n" \
            "$(gsettings get "$base" name | tr -d "'")" \
            "$(gsettings get "$base" binding | tr -d "'")" \
            "$(gsettings get "$base" command | tr -d "'")"
    done
}

shortcut-used() {
    local needle="$1"

    if [[ -z "$needle" ]]; then
        echo "Usage: shortcut-used <binding>"
        return 1
    fi

    while read -r schema; do
        while read -r key; do
            local value
            value=$(gsettings get "$schema" "$key" 2>/dev/null) || continue

            # Single binding
            if [[ "$value" == "'$needle'" ]]; then
                printf "%s :: %s = %s\n" "$schema" "$key" "$value"
            fi

            # List of bindings
            if [[ "$value" == *"'$needle'"* ]]; then
                printf "%s :: %s = %s\n" "$schema" "$key" "$value"
            fi
        done < <(gsettings list-keys "$schema" 2>/dev/null)
    done < <(gsettings list-schemas)
}

add-shortcut() {
    local name="$1"
    local command="$2"
    local binding="$3"

    local schema="org.gnome.settings-daemon.plugins.media-keys"

    # Validate arguments
    if [[ $# -ne 3 ]]; then
        echo "Usage: add-shortcut <name> <command> <binding>"
        return 1
    fi

    # Ensure gsettings exists
    if ! command -v gsettings >/dev/null; then
        echo "Error: gsettings is not installed."
        return 1
    fi

    # Warn if the executable doesn't exist.
    # (Skip the check if the command contains spaces.)
    if [[ "$command" != *" "* ]] && ! command -v "$command" >/dev/null; then
        echo "Warning: '$command' is not on your PATH."
    fi

    # Read current shortcuts
    local current
    current=$(gsettings get "$schema" custom-keybindings)

    # Check for duplicate names/bindings and find the next free index.
    local i=0
    while [[ "$current" == *"custom$i"* ]]; do
        local path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom$i/"
        local base="$schema.custom-keybinding:$path"

        local existing_name existing_binding

        existing_name=$(gsettings get "$base" name 2>/dev/null | tr -d "'")
        existing_binding=$(gsettings get "$base" binding 2>/dev/null | tr -d "'")

        if [[ "$existing_name" == "$name" ]]; then
            echo "Error: shortcut '$name' already exists."
            return 1
        fi

        if [[ "$existing_binding" == "$binding" ]]; then
            echo "Error: binding '$binding' is already in use."
            return 1
        fi

        ((i++))
    done

    local path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom$i/"

    # Append to the list
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

    echo "✓ Added '$name'"
    echo "  Command : $command"
    echo "  Binding : $binding"
    echo "  Path    : custom$i"
}

add-shortcut "Ghostty" "ghostty" "<Super>t"
