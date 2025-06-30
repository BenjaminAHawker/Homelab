#!/bin/bash

# Hawk Home - Audiobookshelf Setup Script

DATA_DIR="data"
CONFIG_DIR="$DATA_DIR/config"
METADATA_DIR="$DATA_DIR/metadata"
TARGET_UID=1000
TARGET_GID=1000

echo "📦 Setting up Audiobookshelf data directories..."

mkdir -p "$CONFIG_DIR"
mkdir -p "$METADATA_DIR"

echo "🔐 Setting ownership to UID:GID $TARGET_UID:$TARGET_GID"
chown -R "$TARGET_UID:$TARGET_GID" "$DATA_DIR"

echo "✅ Done. You can now run: docker compose up -d"