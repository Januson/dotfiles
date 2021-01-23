#!/usr/bin/env bash
set -e

echo "Setting up the local dev environment..."
ansible-playbook -i inventory.txt dotfiles.yml --ask-become-pass
