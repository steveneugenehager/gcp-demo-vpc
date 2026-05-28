# 00a-create-demo-service-accounts.sh 
# 2026-05-28 Steve Hager - Created.

# Set the project ID variable 

PROJECT_ID="random-words-23478"
gcloud config set project $PROJECT_ID


gcloud iam service-accounts create demonstration-infra-mgr-sa \
  --description="Demonstration Infrastructure Manager Service Account" \
  --display-name="Demonstration Infra Mgr SA"

# Example Output
#Created service account [demonstration-infra-mgr-sa].