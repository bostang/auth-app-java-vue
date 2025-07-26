# Tahap 1: Build aplikasi Vue
FROM node:20-alpine as build-stage

WORKDIR /app

# Definisikan ARG untuk menerima variabel build-time
ARG VUE_APP_API_BASE_URL 

# Jadikan sebagai variabel lingkungan di tahap build agar npm run build bisa mengambilnya
ENV VUE_APP_API_BASE_URL=$VUE_APP_API_BASE_URL 

# Salin package.json dan package-lock.json untuk menginstal dependensi
COPY package*.json ./

# Instal dependensi
RUN npm install

# Salin sisa kode aplikasi
COPY . .

# Build aplikasi Vue untuk produksi.
# Pastikan VUE_APP_API_BASE_URL diatur dengan benar untuk lingkungan produksi Anda.
# Untuk deployment lokal Docker, kita akan mengatasinya via Docker Compose.
RUN npm run build

# Tahap 2: Sajikan aplikasi dengan Nginx
FROM nginx:alpine as production-stage

# Hapus konfigurasi Nginx default
RUN rm -rf /etc/nginx/conf.d/*

# Salin konfigurasi Nginx kustom Anda (akan kita buat selanjutnya)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Salin hasil build aplikasi Vue ke direktori Nginx
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Ekspos port Nginx
EXPOSE 80

# Command untuk memulai Nginx
CMD ["nginx", "-g", "daemon off;"]