#!/bin/bash

# Hawk Home - portainer Service Data Setup Script (for root user)

DATA_DIR="data"
PORTAINER_DIR="$DATA_DIR/portainer"
AGENT_DIR="$DATA_DIR/portainer-agent"
TARGET_UID=1000
TARGET_GID=1000

echo "🔧 Starting Hawk Home portainer data setup..."

# Create main data directory if it doesn't exist
if [ ! -d "$DATA_DIR" ]; then
  echo "📂 Creating main data directory: $DATA_DIR"
  mkdir -p "$DATA_DIR"
fi

# Create subdirectories
echo "📁 Creating subdirectories for portainer and portainer-agent..."
mkdir -p "$PORTAINER_DIR"
mkdir -p "$AGENT_DIR"

# Set ownership
echo "🔐 Setting ownership to UID:GID $TARGET_UID:$TARGET_GID on $DATA_DIR"
chown -R "$TARGET_UID:$TARGET_GID" "$DATA_DIR"

echo "✅ Setup complete!"
echo "📦 Data directories:"
echo "  - $PORTAINER_DIR"
echo "  - $AGENT_DIR"
echo "🚀 You can now run: docker compose up -d"