# 00d-grant-specific-user-roles.sh
# 2026-05-28 Steve Hager - Created.

# Set the project ID variable 

PROJECT_ID="random-words-23478"
gcloud config set project $PROJECT_ID

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="user:steven.eugene.hager@gmail.com" \
    --role="roles/cloudbuild.connectionAdmin"

# Example Output
