#!/bin/bash

# Hawk Home - Homepage Startup Script

# Set default UID:GID values (can be edited or sourced from .env if needed)
PUID=1000
PGID=1000

# Define paths
DATA_DIR="./data"
CONFIG_DIR="$DATA_DIR/config"
IMAGE_DIR="$DATA_DIR/images"

echo "📦 Setting up Homepage data directories..."

# Create internal config directory if it doesn't exist
if [ ! -d "$CONFIG_DIR" ]; then
  mkdir -p "$CONFIG_DIR"
  echo "✅ Created directory: $CONFIG_DIR"
else
  echo "ℹ️ Directory already exists: $CONFIG_DIR"
fi

# Create images directory if it doesn't exist
if [ ! -d "$IMAGE_DIR" ]; then
  mkdir -p "$IMAGE_DIR"
  echo "✅ Created directory: $IMAGE_DIR"
else
  echo "ℹ️ Directory already exists: $IMAGE_DIR"
fi

# Set permissions
echo "🔐 Setting ownership to $PUID:$PGID"
chown -R "$PUID:$PGID" "$DATA_DIR"

echo "✅ Setup complete! You can now run: docker compose up -d"