# Stellar Free Theme v2 for Pterodactyl

Tema gratis mirip Stellar untuk panel Pterodactyl dengan:
- Pilihan warna (Ungu, Biru, Merah)
- Efek Glassmorphism (transparan + blur)
- Toggle Dark/Light Mode

## Instalasi Otomatis
```bash
cd /var/www/pterodactyl
wget https://raw.githubusercontent.com/samzmarket/stellar-free-theme/main/install-stellar-auto.sh
chmod +x install-stellar-auto.sh
./install-stellar-auto.sh
```

## Instalasi Manual
1. Upload `stellar-custom.css` ke `/public/`
2. Tambahkan kode `insert-to-app-blade.html` ke file blade yang ada tag `</head>` (biasanya `admin.blade.php`)
3. Jalankan:
```bash
php artisan view:clear
php artisan optimize
```

## Lisensi
Gratis untuk digunakan dan dimodifikasi.
