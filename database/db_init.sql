-- db_init.sql
-- skrip ini digunakan untuk menginisialisasi database

-- akan di-mount ke dalam container PostgreSQL pada saat startup
-- pastikan file ini berada di dalam folder 'database' pada direktori proyek

-- hapus tabel users jika ada
DROP TABLE IF EXISTS users;
-- buat tabel users
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);