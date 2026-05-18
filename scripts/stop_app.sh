#!/bin/bash

echo "=== ApplicationStop: Stopping Node.js app ==="

if command -v pm2 &> /dev/null; then
  pm2 stop aws-cicd-sample 2>/dev/null || true
  pm2 delete aws-cicd-sample 2>/dev/null || true
fi

echo "=== ApplicationStop complete ==="
