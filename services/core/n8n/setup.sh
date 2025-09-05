#!/bin/bash

# Hawk Home - n8n Service Data Setup Script (for root user)

DATA_DIR="data"
N8N_DIR="$DATA_DIR/n8n"
POSTGRES_DIR="$DATA_DIR/postgres"
TARGET_UID=1000
TARGET_GID=1000

echo "🔧 Starting Hawk Home n8n data setup..."

# Create main data directory if it doesn't exist
if [ ! -d "$DATA_DIR" ]; then
  echo "📂 Creating main data directory: $DATA_DIR"
  mkdir -p "$DATA_DIR"
fi

# Create subdirectories
echo "📁 Creating subdirectories for n8n and postgres..."
mkdir -p "$N8N_DIR"
mkdir -p "$POSTGRES_DIR"

# Set ownership
echo "🔐 Setting ownership to UID:GID $TARGET_UID:$TARGET_GID on $DATA_DIR"
chown -R "$TARGET_UID:$TARGET_GID" "$DATA_DIR"

echo "✅ Setup complete!"
echo "📦 Data directories:"
echo "  - $N8N_DIR"
echo "  - $POSTGRES_DIR"
echo "🚀 You can now run: docker compose up -d"