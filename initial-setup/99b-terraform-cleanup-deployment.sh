# 99b-terraform-cleanup-deployment.sh - Cleanup the Zookeeper deployment created by Terraform.
# 2026-05-28 Steve Hager - Created.

# Set the project ID variable 

PROJECT_ID="random-words-23478"
gcloud config set project $PROJECT_ID

gcloud infra-manager deployments delete projects/${PROJECT_ID}/locations/us-central1/deployments/zookeeper-deployment

# Example Output