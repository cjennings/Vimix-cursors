#!/bin/sh

ROOT_UID=0
DEST_DIR=
SYSTEM=$(uname)

# MacOS and the BSDs install to /usr/local/share
if echo "$SYSTEM" | grep -q "Darwin\|BSD$"; then
    DEST_DIR="/usr/local/share/icons"
# Linux installs to /usr/share
elif echo "$SYSTEM" | grep -q "Linux"; then
    DEST_DIR="/usr/share/icons"
fi

# If not ROOT, always install to ~/.local/share
if test "$UID" -ne "$ROOT_UID"; then
    DEST_DIR="$HOME/.local/share/icons"
    mkdir -p "$DEST_DIR"
fi

# remove previous installations if they exist
[ -d "$DEST_DIR/Vimix-cursors" ] && rm -rf "$DEST_DIR/Vimix-cursors"
[ -d "$DEST_DIR/Vimix-white-cursors" ] && rm -rf "$DEST_DIR/Vimix-white-cursors"

# capital R is recursive on all systems
cp -R dist/ "$DEST_DIR/Vimix-cursors"
cp -R dist-white/ "$DEST_DIR/Vimix-white-cursors"

echo "Finished..."
