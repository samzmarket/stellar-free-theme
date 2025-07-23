# Stellar Free Theme v2 for Pterodactyl

Tema gratis mirip Stellar untuk panel Pterodactyl **dengan fitur tambahan**:
- Pilihan warna (Ungu, Biru, Merah)
- Glassmorphism (blur transparan)
- Dark/Light mode toggle

## Instalasi Manual
1. Upload `stellar-custom.css` ke `/public/`
2. Sisipkan `insert-to-app-blade.html` ke `app.blade.php`
3. Jalankan:
```bash
php artisan view:clear
php artisan optimize
```

## Instalasi Otomatis
```bash
chmod +x install-stellar-free.sh
./install-stellar-free.sh
```

## Pilihan Warna
- Default: Ungu
- Tambahan: Biru (`theme-blue`) & Merah (`theme-red`)

## Preview
![Preview Banner](https://i.imgur.com/4ZQvWmP.png)
