-- table_init.sql
-- skrip ini digunakan untuk menginisialisasi tabel di database auth_db

-- jalankan dengan:
-- psql -U auth_user -d auth_db -f table_init.sql

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);