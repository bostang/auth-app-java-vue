# auth-app-java-vue

## Cara Menjalankan (local)

```bash
# buka tab baru di terminal, pindah ke direktori /frontend/
npm install     # install dependencies
npm run serve   # jalankan app

# buka tab baru di terminal, pindah ke direktori /backend/
./mvnw spring-boot:run  # jalankan app sringboot
```

## Docker compose

script `.sql` yang di-mount pada container DB akan dijalankan ketika folder kosong. Maka berikan `-v` saat `docker compose down` untuk menghapus volume sehingga menjadi `docker compose down -v`.
