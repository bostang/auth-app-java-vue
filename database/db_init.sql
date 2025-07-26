-- db_init.sql
-- skrip ini digunakan untuk menginisialisasi database

-- jalankan dengan:
-- psql -U postgres -f db_init.sql

-- koneksi ke database postgres terlebih dahulu
\c postgres;

-- hapus semua objek yang dimiliki oleh auth_user
-- ini akan menghapus semua tabel, views, dan lainnya yang dimiliki oleh auth_user
REASSIGN OWNED BY auth_user TO postgres;
DROP OWNED BY auth_user;

-- hapus role auth_user jika ada
DROP ROLE IF EXISTS auth_user;

-- buat role auth_user dengan password
CREATE ROLE auth_user WITH LOGIN PASSWORD 'password';

-- hapus database auth_db jika ada
DROP DATABASE IF EXISTS auth_db;
CREATE DATABASE auth_db WITH OWNER auth_user;

-- beri hak akses kepada auth_user untuk membuat objek di database auth_db
GRANT ALL PRIVILEGES ON DATABASE auth_db TO auth_user;
