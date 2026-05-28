# Set the project ID variable 

PROJECT_ID="random-words-23478"

gcloud projects create $PROJECT_ID --name="DEMONSTRATION PROJECT"

gcloud billing accounts list

gcloud billing projects link $PROJECT_ID --billing-account=BILLING_ACCOUNT_ID

gcloud services enable compute.googleapis.com --project=$PROJECT_ID