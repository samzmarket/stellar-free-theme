#!/bin/bash
# Stellar Free Theme v2 Installer (FIXED)
PANEL_DIR="/var/www/pterodactyl"
BLADE_FILE="$PANEL_DIR/resources/views/layouts/app.blade.php"
PUBLIC_DIR="$PANEL_DIR/public"

echo "=== Installing Stellar Free Theme v2 ==="

# Download CSS
curl -o $PUBLIC_DIR/stellar-custom.css "https://raw.githubusercontent.com/samzmarket/stellar-free-theme/main/stellar-custom.css"

# Kode toggle untuk dimasukkan
CODE='<link rel="stylesheet" href="/stellar-custom.css">
<button id="themeToggle" class="theme-toggle">🌓 Toggle Mode</button>
<div style="display:flex;gap:10px;margin-top:10px;">
  <button onclick="setTheme(\'theme-purple\')" class="theme-toggle">Ungu</button>
  <button onclick="setTheme(\'theme-blue\')" class="theme-toggle">Biru</button>
  <button onclick="setTheme(\'theme-red\')" class="theme-toggle">Merah</button>
</div>
<script>
function setTheme(color){
  document.body.classList.remove("theme-purple","theme-blue","theme-red");
  document.body.classList.add(color);
  localStorage.setItem("colorTheme", color);
}
document.addEventListener("DOMContentLoaded", () => {
  const saved = localStorage.getItem("colorTheme");
  if(saved) document.body.classList.add(saved);

  const toggle = document.getElementById("themeToggle");
  toggle.addEventListener("click", () => {
    document.body.classList.toggle("light-mode");
    localStorage.setItem("theme", document.body.classList.contains("light-mode") ? "light" : "dark");
  });

  if(localStorage.getItem("theme") === "light"){
    document.body.classList.add("light-mode");
  }
});
</script>'

# Tambahkan kode jika belum ada
if ! grep -q "stellar-custom.css" "$BLADE_FILE"; then
    sed -i "/<\/head>/i $CODE" "$BLADE_FILE"
    echo "[OK] Kode toggle berhasil ditambahkan."
else
    echo "[INFO] Kode toggle sudah ada, lewati penambahan."
fi

# Clear cache Laravel
cd $PANEL_DIR
php artisan view:clear
php artisan optimize

echo "=== Stellar Free Theme v2 Installed Successfully ==="
