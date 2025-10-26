#!/bin/bash

# Hawk Home - qBittorrent Startup Script

# Set default UID:GID values (can be edited or sourced from .env if needed)
PUID=1000
PGID=1000

# Define paths
DATA_DIR="./data"
CONFIG_DIR="$DATA_DIR/config"
GLUETUN_DIR="$DATA_DIR/gluetun"

echo "📦 Setting up qBittorrent data directories..."

# Create internal config directory
mkdir -p "$CONFIG_DIR"
mkdir -p "$GLUETUN_DIR"

# Set permissions
echo "🔐 Setting ownership to $PUID:$PGID"
chown -R "$PUID:$PGID" "$DATA_DIR"

echo "✅ Setup complete! You can now run: docker compose up -d"