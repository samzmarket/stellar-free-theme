# Stellar Free Theme v2 for Pterodactyl

Tema gratis mirip Stellar untuk panel Pterodactyl dengan:
- Pilihan warna (Ungu, Biru, Merah)
- Efek Glassmorphism (transparan + blur)
- Toggle Dark/Light Mode

## Instalasi Otomatis (Download CSS)
```bash
cd /var/www/pterodactyl
wget https://raw.githubusercontent.com/samzmarket/stellar-free-theme/main/install-stellar-simple.sh
chmod +x install-stellar-simple.sh
./install-stellar-simple.sh
```

## Instalasi Manual
1. Upload `stellar-custom.css` ke `/public/`
2. Tambahkan kode `insert-to-app-blade.html` ke `app.blade.php`
3. Jalankan:
```bash
php artisan view:clear
php artisan optimize
```

## Lisensi
Gratis untuk digunakan dan dimodifikasi.
