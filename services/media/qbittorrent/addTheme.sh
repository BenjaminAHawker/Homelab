#!/bin/bash

# Directory name
THEME_DIR="theme"

# Check if directory exists
if [ ! -d "$THEME_DIR" ]; then
    echo "Directory '$THEME_DIR' not found. Creating..."
    mkdir -p "$THEME_DIR"
else
    echo "Directory '$THEME_DIR' already exists."
fi

# Clone the Dracula qBittorrent theme into the theme directory
echo "Cloning Dracula qBittorrent theme..."
git clone https://github.com/dracula/qbittorrent.git "$THEME_DIR"

# Set permissions
echo "🔐 Setting ownership to $PUID:$PGID"
chown -R "$PUID:$PGID" "$THEME_DIR"

echo "Done."