# Build image Docker frontend
docker build -t asia-southeast1-docker.pkg.dev/primeval-rune-467212-t9/auth-app-repo/auth-frontend:latest ./frontend

# Push image frontend
docker push asia-southeast1-docker.pkg.dev/primeval-rune-467212-t9/auth-app-repo/auth-frontend:latest