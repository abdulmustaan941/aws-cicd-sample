#!/bin/bash
set -e

echo "=== BeforeInstall: Preparing server ==="

# Install Node.js 18 if not present
if ! command -v node &> /dev/null; then
  echo "Installing Node.js..."
  curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
  apt-get install -y nodejs
fi

# Clean previous deployment
if [ -d /home/ubuntu/app ]; then
  rm -rf /home/ubuntu/app
fi

mkdir -p /home/ubuntu/app

echo "=== BeforeInstall complete ==="
