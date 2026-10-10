#!/usr/bin/env bash
set -e

if [ "$EUID" -ne 0 ]; then
  echo "[-] Please run install.sh with sudo / root permissions."
  exit 1
fi

echo "[*] Installing coreboost to /usr/local/bin/coreboost..."
install -m 755 coreboost /usr/local/bin/coreboost

echo "[*] Setting up systemd service..."
install -m 644 coreboost.service /etc/systemd/system/coreboost.service
systemctl daemon-reload
systemctl enable coreboost.service

echo "[✓] Installation complete! Run 'coreboost' in your terminal."
