#!/bin/bash
# Installer Stellar Free Theme v2
PANEL_DIR="/var/www/pterodactyl"
PUBLIC_DIR="$PANEL_DIR/public"
echo "=== Stellar Free Theme v2 Installer ==="
if [ ! -d "$PANEL_DIR" ]; then
  echo "Error: Pterodactyl folder not found!"
  exit 1
fi
curl -o $PUBLIC_DIR/stellar-custom.css "https://raw.githubusercontent.com/samzmarket/stellar-free-theme/main/stellar-custom.css"
BLADE_FILE="$PANEL_DIR/resources/views/layouts/app.blade.php"
if ! grep -q "stellar-custom.css" "$BLADE_FILE"; then
  echo "Adding toggle code..."
  sed -i '/<\/head>/i <link rel="stylesheet" href="/stellar-custom.css"><button id="themeToggle" class="theme-toggle">🌓 Toggle Mode</button><div style="display:flex;gap:10px;margin-top:10px;"><button onclick="setTheme(\'theme-purple\')" class="theme-toggle">Ungu</button><button onclick="setTheme(\'theme-blue\')" class="theme-toggle">Biru</button><button onclick="setTheme(\'theme-red\')" class="theme-toggle">Merah</button></div><script>function setTheme(color){document.body.classList.remove(\'theme-purple\',\'theme-blue\',\'theme-red\');document.body.classList.add(color);localStorage.setItem(\'colorTheme\', color);}document.addEventListener(\'DOMContentLoaded\', () => {const saved = localStorage.getItem(\'colorTheme\');if(saved) document.body.classList.add(saved);const toggle = document.getElementById(\'themeToggle\');toggle.addEventListener(\'click\', () => {document.body.classList.toggle(\'light-mode\');localStorage.setItem(\'theme\', document.body.classList.contains(\'light-mode\') ? 'light' : 'dark');});if(localStorage.getItem(\'theme\') === 'light'){document.body.classList.add(\'light-mode\');}});</script>' $BLADE_FILE
fi
cd $PANEL_DIR
php artisan view:clear
php artisan optimize
echo "=== Install Complete! Refresh your panel ==="
