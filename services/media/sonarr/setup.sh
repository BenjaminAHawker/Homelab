#!/bin/bash

# Hawk Home - Sonarr Startup Script

# Set default UID:GID values (can be edited or sourced from .env if needed)
PUID=1000
PGID=1000

# Define paths
DATA_DIR="./data"
CONFIG_DIR="$DATA_DIR/config"
ANIME_DIR="$CONFIG_DIR/anime"
TV_DIR="$CONFIG_DIR/tv"

echo "📦 Setting up Sonarr data directories..."

# Create internal config directory
mkdir -p "$CONFIG_DIR"
mkdir -p "$ANIME_DIR"
mkdir -p "$TV_DIR"

# Set permissions
echo "🔐 Setting ownership to $PUID:$PGID"
chown -R "$PUID:$PGID" "$DATA_DIR"

echo "✅ Setup complete! You can now run: docker compose up -d"