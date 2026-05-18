#!/bin/bash
set -e

echo "=== AfterInstall: Installing app dependencies ==="

cd /home/ubuntu/app

# Install production dependencies only
npm install --production

# Set correct ownership
chown -R ubuntu:ubuntu /home/ubuntu/app

echo "=== AfterInstall complete ==="
