# This script creates a GKE cluster using Terraform.
# Ensure you have the necessary permissions and that your gcloud is configured correctly.
cd ../terraform
terraform init
terraform plan -out tfplan
terraform apply -auto-approve tfplan

