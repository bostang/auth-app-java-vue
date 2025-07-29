gcloud artifacts repositories create auth-app-repo \
    --repository-format=docker \
    --location=asia-southeast1 \
    --description="Docker repository for Auth App"

gcloud auth configure-docker asia-southeast1-docker.pkg.dev