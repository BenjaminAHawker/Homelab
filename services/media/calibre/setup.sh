#!/bin/bash

# Hawk Home - Calibre Web Setup Script

DATA_DIR="data"
CONFIG_DIR="$DATA_DIR/config"
LIBRARY_DIR="$DATA_DIR/library"
TARGET_UID=1000
TARGET_GID=1000

echo "📦 Setting up Calibre Web data directories..."

mkdir -p "$CONFIG_DIR"
mkdir -p "$LIBRARY_DIR"

echo "🔐 Setting ownership to UID:GID $TARGET_UID:$TARGET_GID"
chown -R "$TARGET_UID:$TARGET_GID" "$DATA_DIR"

echo "✅ Done. You can now run: docker compose up -d"