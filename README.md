# auth-app-java-vue

## Cara Menjalankan (Docker compose)

```bash
# untuk membangun dan menjalankan semua container :
docker compose up --build

# apabila sudah selesai :
docker compose down
```

**Catatan** :

- Untuk container `db`,script `.sql` yang di-mount pada container DB akan dijalankan ketika folder kosong. Maka berikan `-v` saat `docker compose down` untuk menghapus volume sehingga menjadi `docker compose down -v`.
- nilai `VUE_APP_API_BASE_URL` diberikan sebagai build argument pada `docker-compose.yml` alih-alih sebagai `env`. Kalau `env`, nilainya tidak ter-_burn_ saat pemanggilan di kode `.js`
- nilai _secrets_ untuk `backend` bisa diberikan langsung dari `env` pada `docker-compose.yml` karena dipanggil melalui `application.properties`
- ketika kita melakukan `docker compose down -v` , maka volume akan ikut terhapus sehingga ketika `docker compose up` ulang, `db` akan menjalankan skrip inisiasi `.sql`.
