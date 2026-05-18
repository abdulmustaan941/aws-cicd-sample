#!/bin/bash
set -e

echo "=== ApplicationStart: Starting Node.js app ==="

# Install PM2 globally if not present
if ! command -v pm2 &> /dev/null; then
  npm install -g pm2
fi

cd /home/ubuntu/app

export NODE_ENV=production
export PORT=3000

# Start or restart the app with PM2
pm2 describe aws-cicd-sample > /dev/null 2>&1 && pm2 restart aws-cicd-sample || pm2 start app.js --name aws-cicd-sample

# Save PM2 process list and enable startup
pm2 save
pm2 startup systemd -u ubuntu --hp /home/ubuntu | tail -1 | bash || true

echo "=== ApplicationStart complete ==="
