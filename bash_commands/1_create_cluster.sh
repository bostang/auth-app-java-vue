gcloud container clusters create vue-java-auth-app \
    --num-nodes=2 \
    --machine-type=e2-medium \
    --region=asia-southeast1 \
    --enable-autoscaling --min-nodes=1 --max-nodes=3 \
    --release-channel=stable