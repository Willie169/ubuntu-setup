#!/usr/bin/env bash

mkdir -p ~/.local/bin
gh_release -w --wget_option '--tries=100 --retry-connrefused --waitretry=5' Oppzippy/OpenSCQ30 openscq30-cli-linux-x86_64
gh_release -w --wget_option '--tries=100 --retry-connrefused --waitretry=5' Oppzippy/OpenSCQ30 openscq30-gui-linux-x86_64
chmod +x openscq30-cli-linux-x86_64
chmod +x openscq30-gui-linux-x86_64
mv openscq30-cli-linux-x86_64 openscq30-cli
mv openscq30-gui-linux-x86_64 openscq30-gui
mv openscq30-cli ~/.local/bin
mv openscq30-gui ~/.local/bin
