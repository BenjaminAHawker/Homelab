#!/bin/bash

# Hawk Home - nginx proxy manager (npm) Service Data Setup Script (for root user)

DATA_DIR="data"
NGINX_DIR="$DATA_DIR/nginx"
LETSENCRYPT_DIR="$DATA_DIR/letsencrypt"
POSTGRES_DIR="$DATA_DIR/postgres"
TARGET_UID=1000
TARGET_GID=1000

echo "🔧 Starting Hawk Home nginx data setup..."

# Create main data directory if it doesn't exist
if [ ! -d "$DATA_DIR" ]; then
  echo "📂 Creating main data directory: $DATA_DIR"
  mkdir -p "$DATA_DIR"
fi

# Create subdirectories
echo "📁 Creating subdirectories for nginx, letsencrypt and postgres..."
mkdir -p "$NGINX_DIR"
mkdir -p "$POSTGRES_DIR"
mkdir -p "$LETSENCRYPT_DIR"

# Set ownership
echo "🔐 Setting ownership to UID:GID $TARGET_UID:$TARGET_GID on $DATA_DIR"
chown -R "$TARGET_UID:$TARGET_GID" "$DATA_DIR"

echo "✅ Setup complete!"
echo "📦 Data directories:"
echo "  - $NGINX_DIR"
echo "  - $POSTGRES_DIR"
echo "  - $LETSENCRYPT_DIR"
echo "🚀 You can now run: docker compose up -d"