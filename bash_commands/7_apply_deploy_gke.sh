# Terapkan Secret untuk database backend (jika ada)
kubectl apply -f k8s/backend-secret.yaml

# Terapkan Deployment dan Service backend
kubectl apply -f k8s/backend-deployment.yaml

# Terapkan ConfigMap Nginx untuk frontend (sudah kita buat di langkah sebelumnya)

# Terapkan Deployment dan Service frontend
kubectl apply -f k8s/frontend-deployment.yaml

# Terapkan Ingress
kubectl apply -f k8s/ingress.yaml