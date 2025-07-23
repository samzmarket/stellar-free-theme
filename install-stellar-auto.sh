#!/bin/bash
# Stellar Free Theme v2 Installer (Auto)

PANEL_DIR="/var/www/pterodactyl"
LAYOUTS_DIR="$PANEL_DIR/resources/views/layouts"
PUBLIC_DIR="$PANEL_DIR/public"

# Deteksi file blade target
if [ -f "$LAYOUTS_DIR/app.blade.php" ]; then
    BLADE_FILE="$LAYOUTS_DIR/app.blade.php"
elif [ -f "$LAYOUTS_DIR/admin.blade.php" ]; then
    BLADE_FILE="$LAYOUTS_DIR/admin.blade.php"
else
    echo "[ERROR] Tidak menemukan app.blade.php atau admin.blade.php"
    exit 1
fi

echo "=== Installing Stellar Free Theme v2 (Auto) ==="
echo "Target file: $BLADE_FILE"

# Download CSS ke /public
curl -o $PUBLIC_DIR/stellar-custom.css "https://raw.githubusercontent.com/samzmarket/stellar-free-theme/main/stellar-custom.css"

# Kode toggle yang akan disisipkan
CODE='<link rel="stylesheet" href="/stellar-custom.css">
<button id="themeToggle" class="theme-toggle">🌓 Toggle Mode</button>
<div style="display:flex;gap:10px;margin-top:10px;">
  <button onclick="setTheme('theme-purple')" class="theme-toggle">Ungu</button>
  <button onclick="setTheme('theme-blue')" class="theme-toggle">Biru</button>
  <button onclick="setTheme('theme-red')" class="theme-toggle">Merah</button>
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

# Cek kalau belum ada Stellar
if ! grep -q "stellar-custom.css" "$BLADE_FILE"; then
    sed -i "/<\/head>/i $CODE" "$BLADE_FILE"
    echo "[OK] Kode Stellar ditambahkan sebelum </head>."
else
    echo "[INFO] Stellar sudah terpasang, tidak menambahkan ulang."
fi

# Clear cache Laravel
cd $PANEL_DIR
php artisan view:clear
php artisan optimize

echo "=== Stellar Free Theme v2 terpasang ==="
