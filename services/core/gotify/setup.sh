#!/bin/bash

# Hawk Home - Gotify Service Data Setup Script (for root user)

DATA_DIR="data"
GOTIFY_DIR="$DATA_DIR/gotify"
POSTGRES_DIR="$DATA_DIR/postgres"
TARGET_UID=1000
TARGET_GID=1000

# Ensure script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "❌ This script must be run as root (try: sudo $0)"
  exit 1
fi

echo "🔧 Starting Hawk Home Gotify data setup..."

# Create main data directory if it doesn't exist
if [ ! -d "$DATA_DIR" ]; then
  echo "📂 Creating main data directory: $DATA_DIR"
  mkdir -p "$DATA_DIR"
else
  echo "ℹ️ Main data directory already exists: $DATA_DIR"
fi

# Create subdirectories
for dir in "$GOTIFY_DIR" "$POSTGRES_DIR"; do
  if [ ! -d "$dir" ]; then
    echo "📁 Creating subdirectory: $dir"
    mkdir -p "$dir"
  else
    echo "ℹ️ Subdirectory already exists: $dir"
  fi
done

# Set ownership only if needed
CURRENT_OWNER=$(stat -c "%u:%g" "$DATA_DIR")
if [ "$CURRENT_OWNER" != "$TARGET_UID:$TARGET_GID" ]; then
  echo "🔐 Updating ownership of $DATA_DIR to UID:GID $TARGET_UID:$TARGET_GID"
  chown -R "$TARGET_UID:$TARGET_GID" "$DATA_DIR"
else
  echo "ℹ️ Ownership already set to UID:GID $TARGET_UID:$TARGET_GID on $DATA_DIR"
fi

echo "✅ Setup complete!"
echo "📦 Data directories:"
echo "  - $GOTIFY_DIR"
echo "  - $POSTGRES_DIR"
echo "🚀 You can now run: docker compose up -d"