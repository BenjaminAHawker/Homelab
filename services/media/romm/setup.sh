#!/bin/bash

# Hawk Home - Romm Startup Script

# Set default UID:GID values (can be edited or sourced from .env if needed)
PUID=1000
PGID=1000

# Define paths
DATA_DIR="./data"
ROMM_DIR="$DATA_DIR/romm"
DB_DIR="$DATA_DIR/db"

echo "📦 Setting up Romm data directories..."

# Create internal directories
mkdir -p "$ROMM_DIR/resources"
mkdir -p "$ROMM_DIR/config"
mkdir -p "$ROMM_DIR/assets"
mkdir -p "$ROMM_DIR/redis"
mkdir -p "$DB_DIR"

# Set permissions
echo "🔐 Setting ownership to $PUID:$PGID"
chown -R "$PUID:$PGID" "$DATA_DIR"

echo "✅ Setup complete! You can now run: docker compose up -d"