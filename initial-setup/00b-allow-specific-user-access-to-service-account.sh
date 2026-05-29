# 00b-allow-specific-user-access-to-service-account.sh
# 2026-05-28 Steve Hager - Created.

# Set the project ID variable 

PROJECT_ID="random-words-23478"
gcloud config set project $PROJECT_ID

gcloud iam service-accounts add-iam-policy-binding \
    demonstration-infra-mgr-sa@$PROJECT_ID.iam.gserviceaccount.com \
    --member="user:steven.eugene.hager@gmail.com" \
    --role="roles/iam.serviceAccountUser"

# Example Output
# Updated IAM policy for serviceAccount [demonstration-infra-mgr-sa@random-words-23478.iam.gserviceaccount.com].
# bindings:
# - members:
#   - user:steven.eugene.hager@gmail.com
#   role: roles/iam.serviceAccountUser
# etag: BwZS6dxuv8Y=
# version: 1