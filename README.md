# auth-app-java-vue

## Cara Menjalankan (local)

```bash
# buka tab baru di terminal, pindah ke direktori /frontend/
npm install     # install dependencies
npm run serve   # jalankan app

# buka tab baru di terminal, pindah ke direktori /backend/
./mvnw spring-boot:run  # jalankan app sringboot
```

## Catatan Menjalankan local

sebelum memulai aplikasi, pastikan database yang dipakai sudah ada. Script telah disiapkan di folder `/database/`.

Jalankan dengan:

```bash
# buat database
psql -U postgres -f db_init.sql

# buat tabel
psql -U auth_user -d auth_db -f table_init.sql
```
