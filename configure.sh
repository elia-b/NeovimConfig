#!/bin/bash

script_dir="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
src="$script_dir"
tgt="$HOME/.config/nvim"
rm -rf "$tgt"
ln -sf "$src" "$tgt"
echo "Linked $src   $tgt"
nvim-update

